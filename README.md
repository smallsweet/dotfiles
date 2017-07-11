# dotfiles

This is a collection of personal configuration files.

The layout is suited best for GNU Stow - which is a symlink manager and can be
found on the [GNU Website](https://www.gnu.org/software/stow/)

You can of course choose to manage it yourself :-).

## Requirements
* [GNU Stow](https://www.gnu.org/software/stow/) (optional)

## Use with GNU Stow

1. ```git clone``` the repo
2. ```cd``` into the repo (default name is dotfiles)
3. run ```stow <foldername> -t ~``` to copy that symlink to the home folder
4. Or run it in a loop for all of them like so:

```bash
for dir in $(ls -d */); do stow $dir -t ~; done
```
