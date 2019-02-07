pipeline {
  environment {
    registry = "korados/epamexam"
    registryCredential = 'DockerHUB'
  }
  agent { node { label 'jenkins-agent' } } 
   stages {
    stage ('Python tests') {
     steps {
        sh """
        python3 -m venv venv
        . venv/bin/activate
        pip install -e .
        export FLASK_APP=js_example
        pip install -e '.[test]'
        coverage run -m pytest
        coverage report
        deactivate
        """
       }
      }
     stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
     stage('Pushing image'){
       steps{
        script {
          docker.withRegistry( '', registryCredential ) {
          dockerImage.push()
          }
         }
       }
     }
  }
}
