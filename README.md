# deck-flake

A basic, simple Nix and Home Manager configuration files for my Steam Deck.
For now there's not really much but it installs some command line tools.

## Foreword

- I'm still a Nix newbie. There might be some dirty codes inside.
- This enables unfree packages. Currently this doesn't install anything unfree but I'm planning to include VSCode.
- Using keyboard or ssh is strongly recommended, since you're going to type some commands.

## Installation

This assumes your Steam Deck is running SteamOS 3.5 or later. 
1. [Setup Nix package manager.](https://xpressrazor.wordpress.com/2024/01/11/using-nix-packages-in-steam-deck/) 
2. Clone this repo. Either use `git clone` or click `Download ZIP` on GitHub web and extract it.
3. Apply the change:
```sh
$ nix --experimental-features 'nix-command flakes' run home-manager/master -- init --switch /path/to/this_repo
```
> [!WARNING]
> Do not create `~/.config/nix/nix.conf` as another way to enable flakes! Doing so will result in Home Manager activation error.

After the initial activation, you can also use:
```sh
$ cd /path/to/this_repo
$ just deploy
```

## Why Home Manager?

The reason why we'd want Nix on the Deck and why Valve listened to the community and gave us `/nix` directory by default is that we want to install packages, since using pacman is not really practical on SteamOS.
For that purpose, `nix-env` just does the job and I personally think there's nothing wrong with that.

However, if a SteamOS update ever touches the directory, it might wipe everything in it, making you lose everything you installed that way.

That's where Nix shines. Installing things in a declarative way allows you to get everything back with few lines of command in such situation.
Plus, with the power of Home Manager, for some apps you can even save configs in the safe location.
