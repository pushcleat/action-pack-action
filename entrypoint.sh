#!/usr/bin/env sh
set -euo pipefail

## Use yq until this PR would be merged https://github.com/google/go-jsonnet/pull/339
jsonnet ./pack.jsonnet \
	--ext-str action="$(yq eval '.' ${SOURCE_DIR}/action.yml -j)" \
	--ext-str image="${IMAGE}" \
	--string \
	--create-output-dirs \
	--output-file ${DESTINATION_DIR}/action.yml

exit $?
