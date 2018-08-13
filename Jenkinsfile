#!groovy

node {
    def spectre_base

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        spectre_base = docker.build("spectreproject/spectre-base")
    }

    stage('Test image') {
        spectre_base.inside {
            sh 'echo "TBD: Tests"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
            spectre_base.push("${env.BUILD_NUMBER}")
            spectre_base.push("latest")
        }
    }
}