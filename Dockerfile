FROM ubuntu@sha256:a7fa45fb43d471f4e66c5b53b1b9b0e02f7f1d37a889a41bbe1601fac70cb54e
ADD modules /puppet/modules
ADD manifests /puppet/manifests
RUN apt -y update
RUN apt -y install puppet
RUN useradd --create-home --home-dir /home/vagrant --user-group vagrant
RUN echo vagrant:vagrant | chpasswd
RUN echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN puppet apply /puppet/manifests/site.pp --modulepath /puppet/modules
RUN apt -y install language-pack-en 
RUN chown -R vagrant /home/vagrant/
