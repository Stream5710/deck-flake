#!/usr/bin/env just --justfile

# default recipe to display help information
default:
  @just --list

# apply changes in home.nix
deploy:
  # TODO: apply flakes
  @home-manager switch
  
