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
        // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
        // So copy required Dockerfile to root dir for each build
        sh "cp ./CentOS/Dockerfile ."
        spectre_base = docker.build("spectreproject/spectre-base-centos")
        sh "rm Dockerfile"
    }
    stage('Push CentOS image') {
        echo("Push of CentOS image disabled at the moment...")
//        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
//            spectre_base.push("${env.BUILD_NUMBER}")
//            spectre_base.push("latest")
//        }
    }

    stage('Build Fedora image') {
        // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
        // So copy required Dockerfile to root dir for each build
        sh "cp ./Fedora/Dockerfile ."
        spectre_base = docker.build("spectreproject/spectre-base-fedora")
        sh "rm Dockerfile"
    }
    stage('Push Fedora image') {
        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
            spectre_base.push("${env.BUILD_NUMBER}")
            spectre_base.push("latest")
        }
    }

    stage('Build Ubuntu image') {
        // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
        // So copy required Dockerfile to root dir for each build
        sh "cp ./Ubuntu/latest//Dockerfile ."
        spectre_base = docker.build("spectreproject/spectre-base-ubuntu")
        sh "rm Dockerfile"
    }
    stage('Push Ubuntu image') {
        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
            spectre_base.push("${env.BUILD_NUMBER}")
            spectre_base.push("latest")
        }
    }

//    stage('Build Ubuntu 16LTS image') {
//        // Copy step on Dockerfile is not working if Dockerfile is not located on root dir!
//        // So copy required Dockerfile to root dir for each build
//        sh "cp ./Ubuntu/16LTS/Dockerfile ."
//        spectre_base = docker.build("spectreproject/spectre-base-ubuntu-16lts")
//        sh "rm Dockerfile"
//    }
//    stage('Push Ubuntu 16LTS image') {
//        echo("Push of Ubuntu 16-LTS image disabled at the moment...")
////        docker.withRegistry('https://registry.hub.docker.com', '051efa8c-aebd-40f7-9cfd-0053c413266e') {
////            spectre_base.push("${env.BUILD_NUMBER}")
////            spectre_base.push("latest")
////        }
//    }
}