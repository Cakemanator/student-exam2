pipeline {
  agent { node { label 'jenkins-agent' } } 
   stages {
    stage ('---test---') {
     steps {
        sh """
        python3 -m venv venv
        . venv/bin/activate
        pip install -e .
        export FLASK_APP=js_example
        pip install -e '.[test]'
        coverage run -m pytest
        coverage report
        """
       }
      }
     }
  environment {
    registry = "korados/epamexam"
    registryCredential = '8c5b921a-ead6-48fd-99c0-2c0c6ac63823'
  }
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
