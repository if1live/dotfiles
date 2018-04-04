#!/bin/sh

rustup update

# install rls
rustup component add rls-preview rust-analysis rust-src

cargo install racer
