# helm-chat-devops

1. Generate java 17 app
curl https://start.spring.io/starter.zip \
  -o myproject.zip \
  -d dependencies=web \
  -d language=java \
  -d type=maven-project \
  -d baseDir=myproject \
  -d bootVersion=2.5.4 \
  -d javaVersion=17

2.DockerFile

3.Generate helm chat using below commands
 helm create my-app

4. update app value in Chart.yml and values.yaml chat file like

