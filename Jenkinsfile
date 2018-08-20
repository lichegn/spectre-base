#!groovy

node('docker') {
    def spectre_base

    stage('Clone repository') {
        checkout scm
    }

    stage('Build Debian image') {
        spectre_base = docker.build("spectreproject/spectre-base")
    }
    stage('Push Debian image') {
        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
            spectre_base.push("${env.BUILD_NUMBER}")
            spectre_base.push("latest")
        }
    }

    stage('Build CentOS image') {
        spectre_base = docker.build("spectreproject/spectre-base-centos")
    }
    stage('Push CentOS image') {
        echo("Push of CentOS image disabled at the moment...")
//        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
//            spectre_base.push("${env.BUILD_NUMBER}")
//            spectre_base.push("latest")
//        }
    }

    stage('Build Fedora image') {
        spectre_base = docker.build("spectreproject/spectre-base-fedora")
    }
    stage('Push Fedora image') {
        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
            spectre_base.push("${env.BUILD_NUMBER}")
            spectre_base.push("latest")
        }
    }

    stage('Build Ubuntu image') {
        spectre_base = docker.build("spectreproject/spectre-base-ubuntu")
    }
    stage('Push Ubuntu image') {
        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
            spectre_base.push("${env.BUILD_NUMBER}")
            spectre_base.push("latest")
        }
    }

    stage('Build Ubuntu 16LTS image') {
        spectre_base = docker.build("spectreproject/spectre-base-ubuntu-16lts")
    }
    stage('Push Ubuntu 16LTS image') {
        echo("Push of Ubuntu 16-LTS image disabled at the moment...")
//        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
//            spectre_base.push("${env.BUILD_NUMBER}")
//            spectre_base.push("latest")
//        }
    }
}