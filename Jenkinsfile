pipeline {
  agent { node { label 'jenkins-agent' } } 
   stages {
    stage ('---run---') {
      steps {
        sh """
        pip install -e .
        export FLASK_APP=js_example
        flask run
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
