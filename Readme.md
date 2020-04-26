⚡⚡⚡   Shazam!   ⚡⚡⚡

Run git command on specified repos parallelly:

##### Usage:
````
    shz status
    shz checkout master
````
    

##### Setup:

Clone the repository:
````
    git clone https://github.com/prayansh1996/shz.git
````

Edit shz:

Add basePath to your repositories
````
    basePath=~/Documents/
````

Add folder names of repositories in basePath
````
    declare -a repos=(search-service experimentation-service)
````


Add path to shazam in your shell's startup file:
- Linux Users:  ~/.bashrc
- Mac Users:    ~/.bash_profile
- Zsh Users:    ~/.zshrc

````
    alias shz='/<path-to-repository>/shz'
````
Source this file or reload you terminal


