#!/usr/bin/env bash
# Preview the documentation in a browser without installing Python packages on the host.
# The site is served from the squidfunk/mkdocs-material image; extra plugins are installed
# inside that container from requirements.txt.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT="${PORT:-8000}"
IMAGE="${MKDOCS_IMAGE:-docker.io/squidfunk/mkdocs-material:latest}"

if ! command -v podman >/dev/null 2>&1; then
    echo "podman is required to serve the documentation." >&2
    exit 1
fi

run_flags=(--rm)
if [[ -t 0 && -t 1 ]]; then
    run_flags+=(-it)
fi

echo "Documentation preview: http://127.0.0.1:${PORT}/"
echo "Stop the server with Ctrl+C."

exec podman run --init "${run_flags[@]}" \
    -p "127.0.0.1:${PORT}:8000" \
    -v "${ROOT}:/docs" \
    -e NO_MKDOCS_2_WARNING=1 \
    --entrypoint sh \
    "${IMAGE}" \
    -c 'pip install -q --root-user-action=ignore -r requirements.txt && exec mkdocs serve --dev-addr=0.0.0.0:8000'
