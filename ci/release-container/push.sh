#!/usr/bin/env bash
set -euo pipefail

main() {
  cd "$(dirname "$0")/../.."
  source ./ci/lib.sh
  VERSION="$(pkg_json_version)"

  imageTag="codercom/code-server:$VERSION"

  docker push "$imageTag"
  docker tag "$imageTag" codercom/code-server:latest
  docker push codercom/code-server:latest
}

main "$@"
