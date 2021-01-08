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
                    branches: [[name: "origin/master"]],
                    doGenerateSubmoduleConfigurations: false,
                    submoduleCfg: [],
                    userRemoteConfigs: [[credentialsId: 'cdc-jenkis', url: "git@172.17.177.40:10022/jenkis/myhome.git"]]
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
