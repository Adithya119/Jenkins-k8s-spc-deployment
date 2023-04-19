pipeline {
    agent {
        label 'k8s_master'
    }
    triggers {
        upstream(upstreamProjects: 'spc-build-and-push-artifacts', threshold: hudson.model.Result.SUCCESS)
    }

    stages {

        stage('git') {
            steps {
                git branch: 'master', poll: false, url: 'https://github.com/Adithya119/Jenkins-k8s-spc-deployment.git'
            }
        }

        stage('shell') {
            steps {
                sh '''pwd
                ls
                whoami'''
            }
        }
    }
}