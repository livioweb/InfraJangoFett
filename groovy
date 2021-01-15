pipeline {
    agent any

    stages {
        stage('LS') {
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
                    userRemoteConfigs: [[credentialsId: 'user_pass_gitlab', url: "http://172.17.177.40:10080/jenkis/my_app.git"]]
                    ]

                sh "ls"
            }
        }
        stage('DockerBuild') {
            steps {
                sh 'echo "Oi Mundo"'
                script {
                    try {
                        sh 'docker build -t my-hello-world .'
                        sh 'docker run -d -p 8080:8080 my-hello-world'
                    } catch (Exception e) {
                        sh "echo $e"
                    }
                }
            }
        }


        stage('Ansible') {
            steps {
                 sh "ansible --version"
                 sh "ansible-playbook -i hosts app_provisioning.yml"
                 sh "ls"
            }
        }

        stage('Notify GitLab') {
            steps {
                echo 'Notify GitLab'
                updateGitlabCommitStatus name: 'build', state: 'pending'
                echo 'build step goes here'
                updateGitlabCommitStatus name: 'build', state: 'success'
            }
        }
    }
}
