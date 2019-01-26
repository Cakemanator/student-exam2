pipeline {
  agent { node { label 'jenkins-agent' } } 
   stages {
    stage ('---run---') {
     steps {
        sh """
        python3 -m venv venv
        . venv/bin/activate
        pip install -e .
        export FLASK_APP=js_example
        """
       }
    }
    stage ('---test---') {
      steps {
        sh """
        pip install -e '.[test]'
        coverage run -m pytest
        coverage report
        """
       }
      }
     }
    }
