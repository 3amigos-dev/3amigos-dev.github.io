#!/bin/bash

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASEDIR="$( dirname "${THISDIR}" )"

cd "${BASEDIR}"
rm -rf "${BASEDIR}/blog/_site"
rm -rf "${BASEDIR}/site"
export JEKYLL_VERSION=3.7.3
docker run --rm \
  "--mount" "type=bind,src=${BASEDIR}/blog,dst=/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll build /srv/jekyll
mv "${BASEDIR}/blog/_site" "${BASEDIR}/site"
if ! git status -s >/dev/null 2>&1 ; then
    echo 'File Modifications Exist.' >&2
    exit 1
fi
