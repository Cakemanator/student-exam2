pipeline {
  agent any
   stages {
    stage ('---run---') {
      steps {
        pip install -e .
        export FLASK_APP=js_example
        flask run
       }
    }
    stage ('---test---') {
      steps {
        pip install -e '.[test]'
        coverage run -m pytest
        coverage report
       }
      }
     }
    }
