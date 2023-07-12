<img
  src="https://user-images.githubusercontent.com/7144173/43552691-6fec96a4-95e3-11e8-8bb3-51bcc6d5e77f.jpg"
  width="500px"
  alt="Cute dalmatian"
  title="A cute dog with coat full of dots"
  align="right"
/>

# [22a's](https://github.com/22a) dotfiles

#### aka. Spooky Lizard Incantation Configuration

This repo contains configuration files for [neovim](https://github.com/neovim/neovim), [zsh](https://github.com/zsh-users/zsh), [tmux](https://github.com/tmux/tmux), [iTerm2](https://github.com/gnachman/iTerm2), and a script to bootstrap a new machine to create an adequately useful development environment.
## ⚠ Warnings ⚠

The bootstrap script has been written with a fresh install in mind, it assumes a blank canvas.
**It will forcibly symlink over your dotfiles** if you let it.

## Installation

Install system specific build tools homebrew will need:
```bash
# macOS, this opens gui dialogs, click accept, etc.
xcode-select --install

# ~unix
sudo apt-get install build-essential
```

Clone this repo:
```bash
git clone https://github.com/22a/dotfiles.git; cd dotfiles;
```

Run the bootstrap script:
```bash
# this will install brew as a first step, the following steps depend on the
# packages from brew so you'll need to make sure `brew` is on $PATH after the
# brew install completes. it's safe to re-run `./bootstrap.sh --all` after,
# it'll pick up where it left off

./bootstrap.sh --all
```

## Post-install configuration

Relaunch your terminal, it'll load the [zim](https://github.com/zimfw/zimfw) packages.

Open `nvim` and install treesitter grammars, debugging adapters, and lanugage servers:
```viml
TSInstall
DapInstall
LspInstall
" eg. LspInstall tsserver ember tailwindcss cssls html jsonls bashls lua_ls
```

### Things you'll have to set up manually

- Generate a new ssh key
    ```bash
    ssh-keygen -t rsa -b 4096 -C "your@email.ie"
    ```
    - Add it to ssh-agent
        ```bash
        ssh-add --apple-use-keychain ~/.ssh/id_rsa
        ```
    - Add it to GitHub - [https://github.com/settings/keys](https://github.com/settings/keys)
        ```bash
        cat ~/.ssh/id_rsa.pub | pbcopy
        ```
- Update the remote for this repo so we can push changes
    ```bash
    git remote set-url origin git@github.com:22a/dotfiles.git
    ```
- Import gpg key to gpg-suite
- Populate `~/.gituser` file
    ```gitconfig
    [user]
      email = your@email.ie
      name = Peter Meehan
      signingkey = DEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF
    ```
    where `signingkey` is the fingerprint for your gpg key, visible under `gpg --list-keys`

### macOS specific manual setup steps
- Remove guest user
- Set up the default iTerm2 profile with a new colorscheme
  - https://github.com/catppuccin/iterm, specifically [mocha](https://github.com/catppuccin/iterm/blob/main/colors/catppuccin-mocha.itermcolors)
- Disable spotlight keyboard shortcuts
  ```
  System Preferences... -> Keyboard -> Shortcuts -> Spotlight -> Untick both
  ```
- Configure Alfred with the `Alfred macOS` theme
