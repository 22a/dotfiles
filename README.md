<img
  src="https://user-images.githubusercontent.com/7144173/43552691-6fec96a4-95e3-11e8-8bb3-51bcc6d5e77f.jpg"
  width="500px"
  alt="Cute dalmatian"
  title="A cute dog with coat full of dots"
  align="right"
/>

# [22a's](https://github.com/22a) dotfiles

#### aka. Spooky Lizard Incantation Configuration

This repo contains configuration files for [neovim](https://github.com/neovim/neovim), [zsh](https://github.com/zsh-users/zsh), [tmux](https://github.com/tmux/tmux), [iTerm2](https://github.com/gnachman/iTerm2), and [macOS](https://www.apple.com/ie/macos) as well as provision scripts to bootstrap a new machine to create an adequately pleasant development environment.


## Prerequisites

* An expensive apple computer*

  \* My personal and work machines are all macs so these dotfiles have been tailored specifically for neovim in iTerm2 on macOS. For \*nix and/or [vim](https://github.com/vim/vim) (not neo) support check out the [legacy linus branch](https://github.com/22a/dotfiles/tree/linus).


## Warnings

The provision scripts have been written with a fresh macOS install in mind, it assumes a blank canvas. **It will forcibly symlink over your dotfiles** if you let it.


## Installation

Install the xcode command line tools:
```bash
xcode-select --install
# Click accept, accept, etc.
```

Clone this repo:
```bash
git clone https://github.com/22a/dotfiles.git;
cd dotfiles
```

Run the provision scripts:
```bash
./scripts/provision/all.sh
```

### Things you'll have to set up manually

* Generate a new ssh key

    ```bash
    ssh-keygen -t rsa -b 4096 -C "your@email.ie"
    ```

    * Add it to ssh-agent

        ```bash
        ssh-add -K ~/.ssh/id_rsa
        ```
    * Add it to GitHub
        [https://github.com/settings/keys](https://github.com/settings/keys)

* Update the remote for this repo so we can push changes

    ```bash
    git remote set-url origin git@github.com:22a/dotfiles.git
    ```

* Import gpg key to gpg-suite

* populate `~/.gituser` file
    ```gitconfig
    [user]
      email = your@email.ie
      name = Peter Meehan
      signingkey = DEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF
    ```
    where `signingkey` is the fingerprint for your gpg key, visible under `gpg --list-keys`


* Disable spotlight keyboard shortcuts

  ```
  System Preferences... -> Keyboard -> Shortcuts -> Spotlight -> Untick both
  ```

* Point Alfred preferences directory to dropbox sync


* Tell iTerm2 to use the config file in the root of this repo
  ```
  General -> Preferences -> Load preferences from a custom foler or URL
  ```
  Then close iTerm entirely: `cmd + alt + q`, and open it again

* Remove guest user

* Add more desktop spaces
