My dotfiles
===========

This repo folder structure is such that it conforms to one expected by Stow.
It is expected to use Stow to manage the symlinking of these files; `brew install stow`
Once Stow is installed, you must first run `stow stow` to symlink the stow configuration. This will cause `stow` to ignore `.DS_Store` files instead of erroring out when trying to symlink them.
You can then link any other wanted folders with `stow <folder>`.



https://www.gnu.org/software/stow/
https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
