pipeline{
    agent any
    tools{
        nodejs "nodeJs"
    }
    stages{
        stage('clone repository'){
            steps{
                git branch: 'main', credentialsId: 'Bautistadev', url: 'https://github.com/Bautistadev/nodejs-helloworld-api.git'
            }
        }
        stage('install'){
            steps{
                sh 'npm install'
            }
        }
        stage('test'){
            steps{
                sh 'npm test'
            }
        }
        stage('docker build'){
            steps{
                script{
                    docker.image("nodejs-helloworld-api:v${BUILD_NUMBER}")
                }
            }
        }
    }
    post{
        always{
            echo 'Pipeline finalizado'
        }
        success{
            echo 'Ejecucion exitosa !!'
        }
        failure{
            script{
                if(currentBuild.result == 'FAILURE'){
                    echo 'EL STAGE : '+env.STAGE_NAME+ ' HA FALLADO'
                }
            }
        }
    }
}
