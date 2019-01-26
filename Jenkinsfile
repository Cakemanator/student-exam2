pipeline {
  environment {
    registry = "korados/epamexam"
    registryCredential = '8c5b921a-ead6-48fd-99c0-2c0c6ac63823'
  }
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
        deactivate
        """
       }
      }
     stage('Building image') {
      steps{
        sh "su -l root"
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
  
