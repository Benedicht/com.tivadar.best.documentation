# Streaming To and From the Server

## Streaming from the server

When the server sends one return value at a time the client can call a callback for every item if the server function is called using the `GetDownStreamController<TDown>` function.

!!! Example
	```cs title="Best SignalR Sample"
	hub.GetDownStreamController<Person>("GetRandomPersons", 20, 2000)
		.OnItem(result => Debug.log("New item arrived: " + result.ToString()))
		.OnSuccess(_ => Debug.log("Streaming finished!"));
	```

`GetDownStreamController`'s return value is a `DownStreamItemController<TDown>` that implements the `IFuture<TResult>` interface. With DownStreamItemController's OnItem function it can be subscribed for a callback that will be called for every downloaded item.
The instance of `DownStreamItemController<TDown>` can be used to cancel the streaming:

!!! Example
	=== "Best SignalR Sample"
		```cs title="Best SignalR Sample"
		var controller = hub.GetDownStreamController<int>("ChannelCounter", 10, 1000);

		controller.OnItem(result => Debug.log("New item arrived: " + result.ToString()))
				  .OnSuccess(_ => Debug.log("Streaming finished!"))
				  .OnError(error => Debug.log("Error: " + error));

		// A stream request can be cancelled any time by calling the controller's Cancel method
		controller.Cancel();
		```

	=== "Server-side Code"
		```cs title="Server-side Code"
		public class TestHub : Hub
		{
			public ChannelReader<Person> GetRandomPersons(int count, int delay)
			{
				var channel = Channel.CreateUnbounded<Person>();

				Task.Run(async () =>
				{
					Random rand = new Random();
					for (var i = 0; i < count; i++)
					{
						await channel.Writer.WriteAsync(new Person { Name = "Name_" + rand.Next(), Age = rand.Next(20, 99) });
				
						await Task.Delay(delay);
					}

					await Clients.Client(Context.ConnectionId).SendAsync("Person", new Person { Name = "Person 000", Age = 0 });
			
					channel.Writer.TryComplete();
				});

				return channel.Reader;
			}
		}
		```

## Streaming to the server

To stream one or more parameters to a server function the `GetUpStreamController` can be used:
??? Example
	```cs title="Best SignalR Sample"
	private IEnumerator UploadWord()
	{
		var controller = hub.GetUpStreamController<string, string>("UploadWord");
		controller.OnSuccess(result =>
			{
				Debug.log("Upload finished!");
			});

		yield return new WaitForSeconds(_yieldWaitTime);
		controller.UploadParam("Hello ");

		yield return new WaitForSeconds(_yieldWaitTime);
		controller.UploadParam("World");

		yield return new WaitForSeconds(_yieldWaitTime);
		controller.UploadParam("!!");

		yield return new WaitForSeconds(_yieldWaitTime);

		controller.Finish();
	}
	```

`GetUpStreamController` is a generic function, its first type-parameter is the return type of the function then 1-5 types can be added as parameter types. The `GetUpStreamController` call returns an `UpStreamItemController` instance that can be used to upload parameters (`UploadParam`), `Finish` or `Cancel` the uploading. 

It also implements the `IDisposable` interface so it can be used in a using statement and will call Finish when disposed. Here's the previous sample using the IDisposable pattern:
??? Example
	=== "Best SignalR Sample"
		```cs title="Best SignalR Sample"
		using (var controller = hub.GetUpStreamController<string, string>("UploadWord"))
		{
			controller.OnSuccess(_ =>
				{
					Debug.log("Upload finished!");
				});

			yield return new WaitForSeconds(_yieldWaitTime);
			controller.UploadParam("Hello ");

			yield return new WaitForSeconds(_yieldWaitTime);
			controller.UploadParam("World");

			yield return new WaitForSeconds(_yieldWaitTime);
			controller.UploadParam("!!");

			yield return new WaitForSeconds(_yieldWaitTime);
		}
		```
		
		The controller also implements the `IFuture` interface to be able to subscribe to the `OnSuccess`, `OnError` and `OnComplete`.

	=== "Server-side Code"
		```cs title="Server-side Code"
		public class UploadHub : Hub 
		{
			public async Task<string> UploadWord(ChannelReader<string> source)
			{
				var sb = new StringBuilder();

				// receiving a StreamCompleteMessage should cause this WaitToRead to return false
				while (await source.WaitToReadAsync())
				{
					while (source.TryRead(out var item))
					{
						Debug.WriteLine($"received: {item}");
						Console.WriteLine($"received: {item}");
						sb.Append(item);
					}
				}

				// method returns, somewhere else returns a CompletionMessage with any errors
				return sb.ToString();
			}
		}
		```

## Streaming *to* and *from* the server

After using `GetDownStreamController` to stream results from the server and `GetUpStreamController` to stream parameters to the server, there's a third one to merge these two's functionality, the `GetUpAndDownStreamController` function. With its help we can stream parameters to a server-side function just like with `GetUpStreamController` and stream down its result to the client like we can with `GetDownStreamController`.

??? Example
	=== "Best SignalR Client"
		```cs
		using (var controller = hub.GetUpAndDownStreamController<string, string>("StreamEcho"))
		{
			controller.OnSuccess(_ =>
			{
				Debug.log("Finished!");
			});

			controller.OnItem(item =>
			{
				Debug.log("On Item: " + item);
			});

			const int numMessages = 5;
			for (int i = 0; i < numMessages; i++)
			{
				yield return new WaitForSeconds(_yieldWaitTime);

				controller.UploadParam(string.Format("Message from client {0}/{1}", i + 1, numMessages));
			}

			yield return new WaitForSeconds(_yieldWaitTime);
		}
		```
		`GetUpAndDownStreamController` also returns with an `UpStreamItemController` instance, but in this case its `OnItem` can be used too. The callback passed to the `OnItem` call will be called for every item the server sends back to the client.

	=== "Server-side Code"
		```cs
		public class UploadHub : Hub
		{
			public ChannelReader<string> StreamEcho(ChannelReader<string> source)
			{
				var output = Channel.CreateUnbounded<string>();

				_ = Task.Run(async () =>
				{
					while (await source.WaitToReadAsync())
					{
						while (source.TryRead(out var item))
						{
							Debug.WriteLine($"Echoing '{item}'.");
							await output.Writer.WriteAsync("echo:" + item);
						}
					}
					output.Writer.Complete();

				});

				return output.Reader;
			}
		}
		```

## Send non-streaming parameter

`GetUpStreamController` and `GetUpAndDownStreamController` can send non-streaming parameters with theirs initial requests.

??? Example
	=== "Best SignalR Client"
		An example of sending multiple non-streaming and a streaming parameter:
		```cs
		public enum MyEnum
		{
			None,
			One,
			Two
		}
		public sealed class Metadata
		{
			public string strData;
			public int intData;
			public MyEnum myEnum;
		}

		using (var controller = hub.GetUpStreamController<int, Person>("MixedArgsTest", /*int: */ 1, /*string: */ "text test", new Metadata() { strData = "string data", intData = 5, myEnum = MyEnum.One }))
		{
			const int numMessages = 5;
			for (int i = 0; i < numMessages; i++)
			{
				Person person = new Person()
				{
					Name = "Mr. Smith",
					Age = 20 + i * 2
				};

				controller.UploadParam(person);
			}
		}
		```
	=== "Server-side Code"
		```cs
		public enum MyEnum
		{
			None,
			One,
			Two
		}

		public sealed class Metadata
		{
			public string strData;
			public int intData;
			public MyEnum myEnum;
		}

		public async Task<int> MixedArgsTest(ChannelReader<Person> source, int intParam, string stringParam, Metadata metadata)
		{
			int count = 0;
			while (await source.WaitToReadAsync())
			{
				while (source.TryRead(out var item))
				{
					count++;
				}
			}

			return count;
		}
		```