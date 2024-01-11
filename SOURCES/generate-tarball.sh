#!/bin/bash
set -e

name=velocity
version="$(sed -n 's/Version:\s*//p' *.spec)"

# RETRIEVE
wget "http://www.apache.org/dist/${name}/engine/${version}/${name}-${version}.tar.gz" -O "${name}-${version}.orig.tar.gz"

rm -rf tarball-tmp
mkdir tarball-tmp
cd tarball-tmp
tar xf "../${name}-${version}.orig.tar.gz"

# CLEAN TARBALL
rm -r */*.jar
rm -r */lib

tar cf "../${name}-${version}.tar.gz" *
cd ..
rm -r tarball-tmp "${name}-${version}.orig.tar.gz"
