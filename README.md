This simple container allows you to run tmate [1] in a safe environment. You can select which directory to share, and the interaction with your peers is confined in the container.

If your source files reside at `/path/to/shareable/dir` then you can spin up the container with:

    docker run -v /path/to/shareable/dir:/workspace -i -t fgimenez/fenced-tmate

[1] http://tmate.io/
