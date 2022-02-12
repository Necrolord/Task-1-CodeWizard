M jenkins/jenkins:latest
COPY plugins.txt /usr/share/jenkins/plugins.txt
# run the install-plugins script to install the plugins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
# copy the config-as-code yaml file into the image
COPY jenkins-casc.yaml /usr/local/jenkins-casc.yaml
# tell the jenkins config-as-code plugin where to find the yaml file
ENV CASC_JENKINS_CONFIG /usr/local/jenkins-casc.yaml


