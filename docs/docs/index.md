# Our philosophy

<p align="center">
<img style="align: center; max-height: 25%; max-width: 25%" src="https://fmnx.ru/dancheg97/fmnx/media/branch/main/airootfs/usr/local/share/backgrounds/fmnx-linux.png" />
</p>

You cannot win the software race in this modern, distributed, open-source world if you are not able to accumulate and integrate different projects into the end system, keeping its cutting edge flow.

This distribution is built for developers who want to use the world's most advanced open-source tooling to instantly start building awesome projects.

---

## Secure your software

<p align="center">
<img style="align: center; max-height: 35%; max-width: 35%" src="/security.png" />
</p>

We offer not just another linux distribution, but a set of easy to deploy infrastructure services, that will help individuals and companies secure their data and software they use.

We introduce [fmnx-pkg](https://fmnx.ru/dancheg97/fmnx-pkg) - self-hosted dockerized repository for arch packages. This project's goal is to provide ability for companies to deploy their own pacman repository in under 5 minutes in any docker container environment (docker/kubernetes/swarm/etc).

Project allows to download packages from AUR, upload `.pkg.tar.zst` and automatically checks integrity and compatability using [yay](https://github.com/Jguer/yay) under the hood. Also offers friendly UI written in dart and gRPC-web based public API.

---

## Increase complexity

<p align="center">
<img style="align: center; max-height: 35%; max-width: 35%" src="/complexity.png" />
</p>

Similarly, as [nuxt](https://nuxtjs.org/) is built on top of [vue](https://vuejs.org/), providing better development experience for complex project, this system goal is to prcisely choose the correct level of abstraction to start building awesome tooling on top of existing projects.

So, we built our installation UI: [fmnx-install](https://fmnx.ru/dancheg97/fmnx-install) on top of [archinstall](https://github.com/archlinux/archinstall) utility. This example shows our approach for choosing extensible open-source projects, and enhancing them with prettier look and feel, to gain competetive advantage over other projects.

So, by picking the modular architechture and correct abstraction complexity level for our projects, we can concentrate on providing additional functionality and enhance overall system experience. Instead of rebuilding things from scratch, we focus on ability to reuse and accumulate existing experience and knowledge.

---

## Modern tools, out of the box

<p align="center">
<img style="align: center; max-height: 35%; max-width: 35%" src="/toolbox.png" />
</p>

This distribution includes a lot of development tools already perfectly adjusted for instant usage. Each tool is guaranteed to provide perfect developer experience, without forcing users to buy additional products or services - each tool is chosen to be free and open source in the first place.

Standart distribution includes following devtools:

- `go` - statically typed, compiled high-level programming language known for simplicity and ease of concurrecy
- `rust` - multi-paradigm, high-level, general-purpose programming language that emphasizes performance and type safety.
- `node` - back-end JavaScript runtime environment, runs on the V8 JavaScript Engine, and executes JavaScript code outside a web browser.
- `flutter` - open-source UI software development kit created by Google.
- `v` - modern statically typed compiled programming language designed for building maintainable software.
- `neovim` - hyperextensible Vim-based text editor.
- `visual-studio-code` - streamlined code editor with support for development operations like debugging, task running, and version control.

Also, we provide [fmnx-dev](https://fmnx.ru/dancheg97/fmnx-dev) repository, which includes single line script, installing and adjusting additional development tools:

- `vscode development extensions` - docker, git, prettier, flutter, etc...
- `golang linters and formatters` - buf, golanglintci, gofumpt
- `gRPC toolchain` - protoc compiler with go and dart plugins, `evans` and `grpclicker` for testing
- `linux devtools` - tools, required for linux system development: qemu, archiso, archinstall, meson, ninja

All this combined can speed-up developer integration - newcomers don't have to spend time adjusting environment, evrything is packed and ready to use.

---

## Style agnosticims

<p align="center">
<img style="align: center; max-height: 35%; max-width: 35%" src="/palette.png" />
</p>

Distribution is not forcing system or applications to have any specific color, but trying to provide addtional adjustments for different software to fit well in end-system. This allows differently styled applications to fit well in end system.

> Currently only gnome supported as desktop environment, but later we are gonna add different options to choose.

Also, when it comes to styling system applications, we try to follow minimalism and material guidelines as main

<!--

## FMNX cli

<p align="center">
<img style="align: center; max-height: 35%; max-width: 35%" src="/code.png" />
</p>

Also, we add

> This part of system is under development stage and currently not included in system.

-->
