pipeline {
    agent {
        label 'k8s_master'
    }
    triggers {
        upstream(upstreamProjects: 'spc-build-and-push-artifacts', threshold: hudson.model.Result.SUCCESS)
    }

    stages {

        stage('git') {
            git branch: 'master', poll: false, url: 'https://github.com/Adithya119/Jenkins-k8s-spc-deployment.git'
        }

        stage('shell') {
            sh '''pwd
            ls
            whoami'''
        }
    }
}