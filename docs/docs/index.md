# Our philosophy

<p align="center">
<img style="align: center; max-height: 25%; max-width: 25%" src="https://fmnx.io/dancheg97/fmnx/media/branch/main/airootfs/usr/local/share/backgrounds/fmnx-linux.png" />
</p>

You cannot win the software race in this modern, distributed, open-source world if you are not able to accumulate and integrate existing software into the end system, keeping its cutting edge flow.

This distribution is providing world's most advanced open-source tooling, working properly without any adjustments out of the box.

---

## Increase complexity

<p align="center">
<img style="align: center; max-height: 35%; max-width: 35%" src="/complexity.png" />
</p>

Similarly, as [nuxt](https://nuxtjs.org/) is built on top of [vue](https://vuejs.org/), providing better development experience for complex project, this system goal is to prcisely choose the correct level of abstraction and build new projects on top of existing software.

So, we built our installation UI: [fmnx-install](https://fmnx.io/dancheg97/fmnx-install) on top of [archinstall](https://github.com/archlinux/archinstall) utility. This example shows our approach for choosing extensible open-source projects, and enhancing them with prettier look and feel, to gain competetive advantage over other projects.

Instead of rebuilding software from scratch, we focus on ability to reuse and accumulate existing experience and knowledge. By picking the modular architechture and correct abstraction complexity level for our projects, we concentrate on providing additional functionality and improving overall system experience.

---

## Modern tools, out of the box

<p align="center">
<img style="align: center; max-height: 35%; max-width: 35%" src="/toolbox.png" />
</p>

This distribution includes a lot of development tools perfectly adjusted for instant usage. Each tool is guaranteed to provide perfect developer experience, and not forcing pruchasing additional products or services - each component is chosen to be free and open source in the first place.

- `go` - statically typed, compiled high-level programming language known for simplicity and ease of concurrecy. Also a lot of go tooling is included: `buf`, `golanglintci`, `gofumpt`, etc...
- `rust` - multi-paradigm, high-level, general-purpose programming language that emphasizes performance and type safety.
- `node` - back-end JavaScript runtime environment, runs on the V8 JavaScript Engine, and executes JavaScript code outside a web browser.
- `flutter` - open-source UI software development kit created by Google.
- `v` - modern statically typed compiled programming language designed for building maintainable software.
- `neovim` - hyperextensible Vim-based text editor.
- `visual-studio-code` - streamlined code editor with support for development operations like debugging, task running, and version control. Also some basic extensions for language support and network operations are already included - `docker`, `git-graph`, `prettier`, `flutter`, etc...
- `gRPC toolchain` - protoc compiler with `go` and `dart` plugins.
- `linux devtools` - tools, required for linux system development: `qemu`, `archiso`, `archinstall`, `meson`, `ninja`.

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

--- 

# Core projects for fmnx linux distribution.

## 📦 [Pack](https://fmnx.io/core/pack) - git based package manager

System provides package manager which main goal is to simplify process of package creation and distribution for developers accumulating power of both `pacman` and `git`. Pack has following features:

- Install and update packages from git repositories
- Compatible with all arch-based distros
- Easy to write config `.pack.yml`

# 💿 [Ainst](https://fmnx.io/core/ainst) - Installation utility

We are building installation utility, which main aim is to provide fluent installation experience by using modern UI framework called flutter. Also we are trying to make it fully customizable at runtime via single yaml file. This will allow different distros to integrate this technology and provide the best installation experience for all linux users.

- Fluent installation experience
- 0 runtime dependencies
- Made with accordance to material design guidelines
- Configurable at runtime (in progress ⚒️⚒️⚒️)

# 🔒 [Repo](https://fmnx.io/core/repo) - Pack repository

This tool is made to help individuals and companies secure software we use. Repo is dockerzied repository for pacman&pack packages, which also allows installation from AUR and git links. This project goal is to provide ability for companies to deploy their own pacman repository in under 5 minutes in any docker container environment (docker/kubernetes/swarm/etc).

Also provides material web UI written in flutter and `gRPC-web` API.

- Install packages from pacman, `.pkg.tar.zst`, AUR or git links with `pack`
- gRPC-web api and material ui for ease of maintanance and administration
- View package description and overall package statistics
- Cache packages between sessions
- Check package integrity on installation

## 🐾 Default gnome desktop environment

At the moment distro comes only with default `gnome` as desktop environment, and not forcing any specific color palette or style. Currently we have added those gnome extensions:

- dash2dock
- gtile

Also, we adjusted keyboard keymaps in such a way, that regular windows users could easily switch to this distro.

## 🛟 System utilities

Also distribution provides set of system utilities which might be very userfull development process:

- Backups
- Disks
- Usage analyser
- System monitor
- Font exolorer
- Emoji explorer
