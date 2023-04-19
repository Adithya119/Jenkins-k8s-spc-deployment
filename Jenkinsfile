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
                sh '''cd ..
                cd spc-build-and-push-artifacts/target/
                cp spring-petclinic-3.0.0-SNAPSHOT.jar /home/ubuntu/jenkins/workspace/My-CI-CD-project/spc-on-k8s
                cd /home/ubuntu/jenkins/workspace/My-CI-CD-project/spc-on-k8s
                ls -ltrh
                sleep 5s
                date
                sleep 5s
                docker image build -f Dockerfile -t adithya119/spc:v3 .
                docker image push adithya119/spc:v3
                sed -i 's/spc:v2/spc:v3/g' spc.yml
                sleep 2s
                kubectl apply -f spc.yml
                kubectl get pods -o yaml | grep image:
                kubectl get pods -o wide
                kubectl get svc
                kubectl get deployments.apps'''
            }
        }
    }
}