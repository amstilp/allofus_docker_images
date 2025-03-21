# allofus_docker_images
Docker images for use in analysis on the AllOfUs Researcher Workbench

## Organization

This repository is comprised of multiple subdirectories, each containing a Dockerfile, plus a helper script (docker.sh) that can be used to build and (optionally) push the docker images.

## Building Docker Images

The `docker.sh` script is used to build and (optionally) push docker images.
It will name the image using the directory name and use the current git commit hash as the tag.

From the repository root director, run the `docker.sh` script:

```bash
./docker.sh <directory_name>
```

The script will build a docker image with the name and tag `aou_<directory_name>:<git_commit_hash>`. If the repository has uncommitted changes, the tag will be `aou_<directory_name>:<git_commit_hash>-dirty`.


## Pushing docker images

In order to push docker images, the repository must have no uncommitted changes as reported by `git status --porcelain`.

To push the image, run the `docker.sh` script with the `-p` argument:

```bash
./docker.sh -p <directory_name>
```
This will build the docker image, tag it with the commit SHA, and push it to DockerHub.
