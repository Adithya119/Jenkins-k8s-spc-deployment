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
                git branch: 'master', url: 'https://github.com/Adithya119/Jenkins-k8s-spc-deployment.git'
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
                docker image build -f Dockerfile -t adithya119/spc:v6 .
                docker image push adithya119/spc:v6
                sed -i 's/spc:v5/spc:v6/g' spc.yml
                sleep 2s
                kubectl apply -f spc.yml
                sleep 30s
                kubectl get pods -o yaml | grep image:
                kubectl get svc'''
            }
        }
    }
}