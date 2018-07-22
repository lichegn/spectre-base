# spectre-base
### Base image to install spectrecoind into

This repository contains a Dockerfile to create base image which could be used
to install spectrecoind into it. So with each build of spectrecoind it is not 
necessary to rebuild the required environment again and again.

## Facts
* Image is based on Debian Stretch
* Dedicated user _spectre_ with UID 1000 and GID 1000
* Boost v1.67
  * libchrono
  * libfilesystem
  * libprogram_options
  * libthread

## How it is build
```
docker build -t hlxeasy/spectre-base:latest .
```

### Using more than one core
If multiple cores available for build, you can pass the amount of cores
to use to the build command:

```
docker build -t hlxeasy/spectre-base:latest --build-arg BUILD_THREADS=6 .
```
