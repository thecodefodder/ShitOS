# SkidOS

## What is SkidOS?

SkidOS is my attempt at making my own operating system.

## What is the goal of SkidOS?

Mostly just for fun, but I also want to learn more about operating systems and how they work.

## Is SkidOS a hobby project?

Yes, it is a hobby project.

## Can i use SkidOS?

Yes but no. Its a bear minimum operating system, so you can use it for whatever you want, but it is not meant to be used as a daily driver.

# Can i use SkidOS for my own project?

Abosolutely! I would love to see you use it but i must admit that it is not the best operating system to use for your own project. It is very bare bones and is not meant to be used as a daily driver. If you want to use it for your own project, please give me credit.

# How do i build SkidOS?

To compile SkidOS, you need to have the following installed:

- [x] [NASM](https://www.nasm.us/)
- [x] [QEMU](https://www.qemu.org/)

Once you have those installed, you can compile SkidOS by running the following command in the root directory of the project:

```bash
nasm -f bin main.asm -o boot.bin
```

then

```bash
qemu-system-x86_64 boot.bin
```

# What IDE do you use?

I use [NeoVim](https://neovim.io/) with the [AstroVim](https://astronvim.com/)
but you can use whatever you want.
