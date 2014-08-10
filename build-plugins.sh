#!/bin/bash
_base="/Users/mkleint/src/nb-dev-ops-dist"
_netbeans_dist=/Applications/NetBeans/NetBeans\ 8.0.app/Contents/Resources/NetBeans


cd "${base}"
#rm -rf target
mkdir target
cd target
hg clone ssh://hg@bitbucket.org/draganbjedov/nb-csv-editor
cd nb-csv-editor
ant nbm -Dnbplatform.active.harness.dir="${_netbeans_dist}"/harness -Dnbplatform.active.dir="${_netbeans_dist}" -Dnbplatform.default.harness.dir="${_netbeans_dist}"/harness -Dnbplatform.default.dir="${_netbeans_dist}"
cd ..
mvn install:install-file -Dfile=./nb-csv-editor/build/netbeans-csv-editor.nbm -DgroupId=netbeans-csv-editor -DartifactId=netbeans-csv-editor -Dversion=custom -Dpackaging=nbm -DgeneratePom=false
mvn install:install-file -Dfile=./nb-csv-editor/build/cluster/modules/netbeans-csv-editor.jar -DgroupId=netbeans-csv-editor -DartifactId=netbeans-csv-editor -Dversion=custom -Dpackaging=jar -DgeneratePom=true

git clone https://github.com/junichi11/netbeans-vagrant-plugin.git
cd netbeans-vagrant-plugin/vagrant
ant nbm -Dnbplatform.active.harness.dir="${_netbeans_dist}"/harness -Dnbplatform.active.dir="${_netbeans_dist}" -Dnbplatform.default.harness.dir="${_netbeans_dist}"/harness -Dnbplatform.default.dir="${_netbeans_dist}"
cd ../..
mvn install:install-file -Dfile=./netbeans-vagrant-plugin/vagrant/build/org-netbeans-modules-vagrant.nbm -DgroupId=org-netbeans-modules-vagrant -DartifactId=org-netbeans-modules-vagrant -Dversion=custom -Dpackaging=nbm -DgeneratePom=false
mvn install:install-file -Dfile=./netbeans-vagrant-plugin/build/cluster/modules/org-netbeans-modules-vagrant.jar -DgroupId=org-netbeans-modules-vagrant -DartifactId=org-netbeans-modules-vagrant -Dversion=custom -Dpackaging=jar -DgeneratePom=true

git clone https://github.com/mkleint/cucumber-netbeans-plugin.git
cd cucumber-netbeans-plugin
ant nbm -Dnbplatform.active.harness.dir="${_netbeans_dist}"/harness -Dnbplatform.active.dir="${_netbeans_dist}" -Dnbplatform.default.harness.dir="${_netbeans_dist}"/harness -Dnbplatform.default.dir="${_netbeans_dist}"
cd ..
mvn install:install-file -Dfile=./cucumber-netbeans-plugin/build/qubit-cucumber-editor.nbm -DgroupId=qubit-cucumber-editor -DartifactId=qubit-cucumber-editor -Dversion=custom -Dpackaging=nbm -DgeneratePom=false
mvn install:install-file -Dfile=./cucumber-netbeans-plugin/build/cluster/modules/qubit-cucumber-editor.jar -DgroupId=qubit-cucumber-editor -DartifactId=qubit-cucumber-editor -Dversion=custom -Dpackaging=jar -DgeneratePom=true


