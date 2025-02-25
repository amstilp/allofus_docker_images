#!/bin/bash

# Script to build and (optionally) push a docker image, tagged with the current git sha.

OPTSTRING=":p"

while getopts ${OPTSTRING} opt; do
  case ${opt} in
    p)
      push=true
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

# If pushing, check if the working directory is clean
if [ -z "$(git status --porcelain)" ]; then
  # Working directory clean
  commit_hash=`git rev-parse --short HEAD`
else
  # Uncommitted changes
  commit_hash=`git rev-parse --short HEAD`-dirty
  if [ "$push" = true ]; then
    git status
    echo ""
    echo "Please stash or commit changes before building and pushing the docker image."
    exit 1
  fi
fi

# Shift arguments so we can get the name of the image to push
shift $(($OPTIND - 1))

# Get the commit sha

# Save the image
image_name_and_tag="amstilp/aou_$1:$commit_hash"

#docker build --platform linux/amd64 -t $image_name_and_tag $1

echo "Built $image_name_and_tag"

if [ "$push" = true ]; then
  #docker push $image_name_and_tag
  echo "Pushed $image_name_and_tag"
fi
