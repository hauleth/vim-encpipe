# vim-encpipe

Plugin that allows seamless file encryption via [encpipe][]

## Why?

Because Vim built-in encryption sucks. It is unsafe, uses obsolete algorithms,
uses no authentication (so attacker can alter data even without knowing
password), uses unsafe mode of operation. In general everything what is in the
sentence "do not invent your own encryption" in one. That is why [NeoVim removed
it][nvim-enc], because it is [really bad](https://dgl.cx/2014/10/vim-blowfish).

Just do not use it, never.

## How?

This uses [encpipe][] which is created by author of awesome [libsodium][], however it
is based on much smaller and simpler [libhydrogen][].

[encpipe]: https://github.com/jedisct1/encpipe
[nvim-enc]: https://github.com/neovim/neovim/commit/85338fe1d5a56f82546e16c305c2048c081771e0
[libsodium]: https://github.com/jedisct1/libsodium
[libhydrogen]: https://github.com/jedisct1/libhydrogen
