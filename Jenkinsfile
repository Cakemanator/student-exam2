pipeline {
  agent any
   stages {
    stage ('---run---') {
      steps {
        sh "pip install -e ."
        sh "export FLASK_APP=js_example"
        sh "flask run"
       }
    }
    stage ('---test---') {
      steps {
        sh "pip install -e '.[test]'"
        sh "coverage run -m pytest"
        sh "coverage report"
       }
      }
     }
    }
