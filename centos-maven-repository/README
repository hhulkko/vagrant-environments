1) Install maven repo machine

    vagrant box add CentOS-6.3-x86_64-minimal 'https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box'
    vagrant up

2) Setup maven2

Either manually from http://maven.apache.org/download.html
Or with homebrew on Mac OsX:

    brew tap homebrew/versions
    brew install maven2

Then edit and copy local/settings.xml to your ~/.m2/ to enable passwordless deployment to the vagrant box

3) Edit local/deploy.rb

Change the following path so that it points to your maven2 installation

    MVN='/usr/local/Cellar/maven2/2.2.1/bin/mvn'

4) Deploy jar

    ./local/deploy.rb  --groupid com.foo.bar /path/to/jar
