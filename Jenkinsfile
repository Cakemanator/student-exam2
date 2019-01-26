pipeline {
  agent { node { label 'jenkins-agent' } } 
   stages {
    stage ('---run---') {
     steps {
        sh """
        python3 -m venv venv
        . venv/bin/activate
        pip install --user -e .
        export FLASK_APP=js_example
        """
       }
    }
    stage ('---test---') {
      steps {
        sh """
        pip install --user -e '.[test]'
        coverage run -m pytest
        coverage report
        """
       }
      }
     }
    }
