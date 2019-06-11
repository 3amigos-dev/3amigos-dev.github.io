#!/bin/bash

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASEDIR="$( dirname "${THISDIR}" )"

cd "${BASEDIR}"
export JEKYLL_VERSION=3.5
docker run --rm \
  "--user" "$(id -u):$(id -g)" \
  "--mount" "type=bind,src=${BASEDIR},dst=/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll build /srv/jekyll
