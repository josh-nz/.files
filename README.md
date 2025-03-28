# My dotfiles

This repo folder structure is such that it conforms to one expected by [Stow](https://www.gnu.org/software/stow/). An outline of how Stow works for dotfile usage is [here](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).

It is expected to use Stow to manage the symlinking of these files; `brew install stow`

Once Stow is installed, you must first run `stow stow`. This will symlink `.stow-global-ignore` causing Stow to ignore .DS_Store files instead of erroring out when trying to symlink them.

You can then link any other wanted folders with `stow <folder>`.

```bash
stow zsh # Just my zsh config
```

```bash
stow */ # Everything (the '/' ignores this README)
```

Unlink a folder with `stow -D <folder>`


## NeoVim config

My NeoVim config was started based on [this series of videos](https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) by [typecraft](https://www.youtube.com/@typecraft_dev).

A bunch of stuff was inspired or outright copied from [this repo](https://github.com/dmmulroy/kickstart.nix/tree/main/config/nvim) and as seen [in this video](https://www.youtube.com/watch?v=oo_I5lAmdi0) by Dillon Mulroy.

The [NeoVim kickstart repo](https://github.com/nvim-lua/kickstart.nvim) is another source of good stuff, and was used as a basis for further adjustments to my config. There is a [corresponding video](https://www.youtube.com/watch?v=m8C0Cq9Uv9o).


## Search

The `search` folder contains a `.ignore` file.

This file is used by tools such as [ripgrep](https://github.com/BurntSushi/ripgrep) and [fd](https://github.com/sharkdp/fd).

The current `.ignore` contents allows the `--hidden` argument to be passed to ripgrep so that it will show hidden files (eg those starting with a `.`) while still ignoring the contents of a `.git` folder. This is necessary when working in folders that contain a lot of hidden files, such as this repo, otherwise many tools will fail to return any results.

More specifics on the use of this file [here](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#automatic-filtering).

## tmux

My tmux config was started based on [this series of videos](https://www.youtube.com/playlist?list=PLsz00TDipIfdrJDjpULKY7mQlIFi4HjdR) by [typecraft](https://www.youtube.com/@typecraft_dev).

Correct use of the tmux config requires the [tmux plugin manager](https://github.com/tmux-plugins/tpm) to be installed. After cloning this repo and stow-ing the tmux folder, run `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm` to install TPM. Then, when inside a tmux session, press `prefix I` to install all referenced plugins.

