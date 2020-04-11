#!/bin/bash

basePath=~/Documents/
declare -a repos=(search-service experimentation-service)

# store process ids and return status of background jobs
declare -a pids
declare -a status

printf "⚡⚡⚡ \e[7m\e[1m\e[93m $i Shazam!  \033[m ⚡⚡⚡ \n"

for name in "${repos[@]}"
do
    path=${basePath}$name

    # -C specifies the directory for git
    # $@ pastes all comman line arguments
    # &> redirects stdout and stderr to file shazam_prefix_<branch-name>
    # & pushes process to background
    git -C $path $@ &> shazam_prefix_${name} &
    
    # $! returns the id of most recently executed background process
    pids+=($!)
done

for pid in "${pids[@]}"
do
    # Wait for async processes with $pid to finish
    wait $pid

    # $? returns the exit status of the last executed command 
    status+=($?)
done

for i in "${!repos[@]}"
do
    name=${repos[$i]}
    
    if [[ ${status[$i]} -gt 0 ]] 
    then
        printf "\n❌ %s ❌\n" $name
    else
        printf "\n⚡ %s ⚡ \n" $name
    fi
    
    cat shazam_prefix_${name}
done

echo
rm shazam_prefix_* || true