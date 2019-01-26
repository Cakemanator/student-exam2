pipeline {
  environment {
    registry = "korados/epamexam"
    registryCredential = '8c5b921a-ead6-48fd-99c0-2c0c6ac63823'
  }
  agent any
   stages {
     stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
  
