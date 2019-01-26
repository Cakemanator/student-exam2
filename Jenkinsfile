pipeline {
  agent { node { label 'jenkins-agent' } } 
   stages {
    stage ('---run---') {
     steps {
        sh """
        python3 -m venv venv
        pip install -e .
        . venv/bin/activate
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
