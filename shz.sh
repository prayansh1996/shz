#!/bin/bash

basePath=~/Documents/
declare -a repos=(search-service experimentation-service)

declare -a pids
declare -a status

printf "⚡⚡⚡ \e[7m\e[1m\e[93m $i Shazam!  \033[m ⚡⚡⚡ \n"

for name in "${repos[@]}"
do
    path=${basePath}$name
    git -C $path $@ &> shazam_prefix_${name} &
    
    pids+=($!)
done

# Wait for all async processes to finish
for pid in "$pids"
do
    wait $pid
    status+=($?)
done

# Check if any of the processes failed
for i in "${!repos[@]}"
do
    name=${repos[$i]}
    
    if [[ ${status[$i]} -gt 0 ]] 
    then
        printf "\n❌ \e[7m\e[1m\e[93m %s Failed \033[m ❌\n" $name
    else
        printf "\n⚡ \e[7m\e[1m\e[93m %s \033[m ⚡ \n" $name
    fi
    
    cat shazam_prefix_${name}
done

# rm shazam_prefix_* || true