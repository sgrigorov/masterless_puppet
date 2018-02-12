touch /tmp/install2
grep \^ID= /etc/os-release | grep "centos" > /dev/null && {
  rpm -ivh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
  yum install git puppet rubygems -y
  gem install r10k
}
lsb_release -i | sed 's/^Distributor ID:\t// ' | grep Ubuntu > /dev/null && {
  touch /tmp/install.ubuntu.sh
  #apt-get install puppet r10k git
}
lsb_release -i | sed 's/^Distributor ID:\t// ' | grep Fedora > /dev/null && {
  touch /tmp/install.fedora1.sh
  rpm -qa puppet | sed 's/-.*//' | grep puppet > /dev/null || {
    dnf install puppet git -y
  }
}

