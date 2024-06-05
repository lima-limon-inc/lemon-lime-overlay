# LL's overlay
My personal Gentoo overlay.
Pull requests more than welcome.

## How to enable the overlay
Thankfully, the lemon-lime-overlay is part of [Gentoo overlay list](https://overlays.gentoo.org/).
To enable, simply run:

```terminal
eselect repository enable lemon-lime
```

Before using it for the first time, you need to sync it:
```terminal
emaint sync -r lemon-lime
```

# Ebuilds in this overlay

- tiburoncin: https://github.com/eldipa/tiburoncin

- cpplint: https://github.com/cpplint/cpplint (fork of google's original cpplint)

- devify: https://github.com/pog102/devify

- byexample: https://github.com/byexamples/byexample

- sdl2cpp: https://github.com/libSDL2pp/libSDL2pp

- mininet: https://github.com/mininet/mininet
