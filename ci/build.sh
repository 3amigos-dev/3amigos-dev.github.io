#!/bin/bash

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASEDIR="$( dirname "${THISDIR}" )"

cd "${BASEDIR}"
export JEKYLL_VERSION=3.7.3
docker run --rm \
  "--mount" "type=bind,src=${BASEDIR}/blog,dst=/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll build /srv/jekyll
