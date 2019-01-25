pipeline {
  agent { node { label 'jenkins-agent' } } 
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
        pip install -e '.[test]'
        coverage run -m pytest
        coverage report
       }
      }
     }
    }
