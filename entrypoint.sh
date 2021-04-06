#!/usr/bin/env sh
set -euo pipefail

APP_WORKDIR=${APP_WORKDIR:-/}

mkdir -p ${DESTINATION_DIR}
cp -rT ${SOURCE_DIR} ${DESTINATION_DIR}

## Use yq until this PR would be merged https://github.com/google/go-jsonnet/pull/339
jsonnet ${APP_WORKDIR}/pack.jsonnet \
	--ext-str action="$(yq eval '.' ${SOURCE_DIR}/action.yml -j)" \
	--ext-str image="${IMAGE}" \
	--string \
	--create-output-dirs \
	--output-file ${DESTINATION_DIR}/action.yml

exit $?
