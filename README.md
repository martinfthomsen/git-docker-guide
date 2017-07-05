# git-docker-guide
> Git and Docker Guides and Walk-throughs for Novices

A Git and Docker guide, walk-through and repository example to help novice users
get a grasp of the distribution tools.

## Citing

This repository has been created as supplementary material to the following
publication:
> Thomsen, MCF et al.
> Distribution of databases and software in bioinformatics.
> JOURNAL NAME; 2017. pp. ??-?? (NOT PUBLISHED YET)

## Getting started

This guide assumes the reader has a good grasp of scripting/coding/programming
and knows how to use a command line shell interface.
To follow the guides you must have the following programs installed
(see the links for installation instructions):
* Docker
   * For Macintosh: https://store.docker.com/editions/community/docker-ce-desktop-mac
   * For Windows: https://store.docker.com/editions/community/docker-ce-desktop-windows
   * For Ubuntu: https://store.docker.com/editions/community/docker-ce-server-ubuntu
* SourceTree (Supports Macintosh and Windows, Linux users are stuck with command line interface (CLI))
   * https://www.sourcetreeapp.com/
* git (Linux):
   * https://www.atlassian.com/git/tutorials/install-git#linux
* git-lfs (Linux):
   * https://github.com/git-lfs/git-lfs/releases/
* git-flow (Linux):
   * http://nvie.com/posts/a-successful-git-branching-model/

The guides are stored as PDF files in the repository. To follow these guides, it
is recommended to clone this repository to your local machine, pull the git-lfs
files, and play around with your local version of the repository while reading
the guide. Hands-on experience is the best way to learn.

For instructions on how to download the repository and the files through
SourceTree, please read git-guide.pdf.

To download the repository and the files through CLI:
```bash
git clone https://github.com/martinfthomsen/git-docker-guide.git
cd git-docker-guide
git lfs pull
```

## Features

This repository serves several purposes:
1. Provides a PDF guide on how to use Git effectively
2. Provides a PDF guide on how to use Docker effectively
3. Provides a showcase for novice users of Git and Docker to inspect, play with, and use as template/reference for their own projects.

## Troubleshooting
#### MAC OS: Cannot run build command
Try running this command to resolve any environment issues:
```bash
eval "$(docker-machine env default)"
```

#### MAC OS: Could not resolve 'http.debian.net'
To solve this, you need to set the DNS of your docker machine.

1. Edit ~/.docker/machine/machines/default/config.json
2. Locate "Dns" under "HostOptions" and "EngineOptions"
3. Add "8.8.8.8" to the list
```
    "Dns": ["8.8.8.8"],
```

Then restart the machine
```bash
docker-machine restart default
eval "$(docker-machine env default)"
```

#### MAC OS: Docker does not mount my directory!
Check if you have added the directory to the file sharing in the docker
preferences. If not add it, and if you have an old version of docker, consider
updating to a new docker version.

#### MAC OS: Docker takes up too much space?
Check the disk space use on the machine:
1. ssh into the virtual machine
```bash
docker-machine ssh default
```
2. Check the disk usage
```bash
df -h
```

If you find that the machine is using too much space and you are not worried
about losing the data on the machine, you can delete the machine and recreate it.

Stop and delete the default machine. (WARNING, this will remove all your
containers, and all data stored inside the containers is lost!)
```bash
docker-machine stop default
docker-machine rm default
docker-machine create --driver virtualbox --virtualbox-disk-size "15360" default
```

--virtualbox-disk-size sets the disk size in MB. This example sets it to 15GB...
Now you can check the disk space again, and it should look fine.
Next step is now to reinstall all your images...

#### How do I remove Docker containers
```bash
# Remove all the exited containers
docker rm -v $(docker ps -aq -f status=exited)

# Stop and remove all containers
docker rm $(docker stop $(docker ps -aq))
```

#### How do I clean up "dangling" Docker images
```bash
docker rmi $(docker images -qf "dangling=true")
```

#### How do I clean up "dangling" Docker volumes
```bash
docker volume rm $(docker volume ls -qf dangling=true)
```

## Contributing

If you'd like to contribute, please use the issue tracker to voice your
suggestions.

## Licensing

Copyright (c) 2017, Martin Christen Frølund Thomsen, Technical University of Denmark.

All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
