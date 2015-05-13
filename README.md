This simple container allows you to run tmate [1] in a safe environment. You can select which directory to share, and the interaction with your peers in that directory is confined in an ubuntu 15.04 docker container, the rest of your system is not accessible to anyone invited to your tmate session.

Moreover, using the `fence_tmate_in` script a user is created in the container with the same uid and gid as the invoking user, so that the ownership of the files created is properly set and even the container is safe during the tmate session, you and your peers can only modify the shared directory.

It requires docker installed and started, for ubuntu the following will do:

    $ sudo apt-get install docker.io
    $ sudo service docker start

With your source files at `/path/to/shareable/dir` you can spin up the container from the root of this project (or from anywhere else if you put the `fence_tmate_in` script in the PATH) with:

    $ ./fence_tmate_in /path/to/shareable/dir

To share the current directory just:

    $ ./fence_tmate_in

While the tmate session is active you can access as root to install additional packages, for instance, first get the container name:

    $ sudo docker ps

    CONTAINER ID    IMAGE                          COMMAND               CREATED         STATUS          PORTS   NAMES
    9d7d157f25be    fgimenez/fenced-tmate:latest   "\"/bin/bash -ci 'ap  19 seconds ago  Up 18 seconds           grave_pasteur

In this case the name is `grave_pasteur`, then access it as root with:

    $ sudo docker exec -it grave_pasteur bash

[1] http://tmate.io/
