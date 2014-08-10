#!/bin/bash
_base="/Users/mkleint/src/community-ruby"
_version="RELEASE80"

_modules="libs.jrubyparser
libs.yydebug
ruby.platform
ruby.rakeproject
ruby"

cd "${_base}"
mkdir build/
cd build
mkdir nbms
cd ..

for f in $_modules
do
    cd "${f}"
    ant nbm
    cp -v build/*.nbm ../build/nbms
    cd ..
done

mv -v ./build/cluster ./build/ruby

mvn3 org.codehaus.mojo:nb-repository-plugin:1.1:populate -DdeployUrl=file://"${_base}"/build/maven-repo -DforcedVersion="${_version}" -DdependencyRepositoryUrl=http://bits.netbeans.org/nexus/content/groups/netbeans/ -DdependencyRepositoryId=netbeans -DnetbeansNbmDirectory=./build/nbms/ -DnetbeansInstallDirectory=./build/