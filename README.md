# spectre-base
### Base image to install spectrecoind into

This repository contains a Dockerfile to create base image which could be used
to install [spectrecoind](https://github.com/spectrecoin/spectre) into it. So 
with each build of spectrecoind it is not necessary to rebuild the required 
environment again and again.

## Facts
* Image is based on Debian Stretch
* Dedicated user _spectre_ with UID 1000 and GID 1000
* Installed packages:
  * ca-certificates
  * mc
  * libqt5webchannel5
  * libtool
  * wget
    
## How it is build
```
docker build -t spectreproject/spectre-base:latest .
```

### Using more than one core
If multiple cores available for build, you can pass the amount of cores
to use to the build command:

```
docker build -t spectreproject/spectre-base:latest --build-arg BUILD_THREADS=12 .
```

Default value is BUILD_THREADS=6