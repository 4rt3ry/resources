Create a symbolic link to make custom update script easily usable.
**MAKE SURE TO RUN THIS IN THE SAME DIRECTORY AS repositories.list**

```
sudo apt install readlink
parent_path=$( cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd -P )
echo $parent_path
ln -s $parent_path/update.sh ~/.local/bin/update
source ~/.profile 
```