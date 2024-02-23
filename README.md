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

A bunch of stuff was inspired or outright copied from [this repo](https://github.com/dmmulroy/kickstart.nix/tree/main/config/nvim) and as seen [in this video](https://www.youtube.com/watch?v=oo_I5lAmdi0).

## Search

The `search` folder contains a `.ignore` file.

This file is used by tools such as [ripgrep](https://github.com/BurntSushi/ripgrep) and [fd](https://github.com/sharkdp/fd).

The current `.ignore` contents allows the `--hidden` argument to be passed to ripgrep so that it will show hidden files (eg those starting with a `.`) while still ignoring the contents of a `.git` folder. This is how NeoVim Telescope is currently configured, for example.

More specifics on the use of this file [here](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#automatic-filtering).


