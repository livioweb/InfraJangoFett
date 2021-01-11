pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                 sh "pwd"
                 sh "ls"
            }
        }
        stage('Clone') {
            steps {
                echo 'Deploying....'

              checkout changelog: true, poll: true, scm: [
                    $class: 'GitSCM',
                   branches: [[name: "master"]],
                    doGenerateSubmoduleConfigurations: false,
                    submoduleCfg: [],
                    userRemoteConfigs: [[credentialsId: 'gitlab-ssh', url: "git@172.17.177.40:10022/jenkis/myhome.git"]]
                    ]
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}


pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                 sh "pwd"
                 sh "ls"
            }
        }
        stage('Clone') {
            steps {
                echo 'Deploying....'
                sh "git clone git@172.17.177.40:10022/jenkis/myhome.git"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
