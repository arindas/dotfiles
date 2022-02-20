#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 GIT_PROVIDER REPO_PATH"
    echo "Clones a repository from the given git provider at the given path"
    echo "git clone flags may be passed with \"FLAGS\" environment variable"
    exit 1
fi

git clone $FLAGS git@"$1":"$2".git $HOME/source/"$1"/"$2"
