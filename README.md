fzf-chrome-active-tab
====

![header](https://user-images.githubusercontent.com/17779386/68013992-ba91ea00-fcd1-11e9-9cb5-7dd78dc4ed8c.png)

**Fuzzy search and activate Chrome tab from terminal.**


## Description

You can activate google chrome tab by fzf.  
This script use a apple script in shell script.

## Demo
![demo.gif](https://user-images.githubusercontent.com/17779386/68667406-3b31cf80-0589-11ea-9a0d-33145e155dc1.gif)

## Requirement

- fzf
- MacOS

## Install

### Homebrew

```bash
$ brew tap Rasukarusan/tap
$ brew install Rasukarusan/tap/fzf-chrome-active-tab
```

### Manually

```bash
$ git clone https://github.com/Rasukarusan/fzf-chrome-active-tab.git
```

## Usage

```bash
# homebrew
$ chrome-tab-activate

# manually
$ cd fzf-chrome-active-tab
$ ./chrome-tab-activate
```

### Options
```bash
$ chrome-tab-activate --preview-window up # up / down / right /left
$ chrome-tab-activate --no-preview
```

## Articles

https://www.rasukarusan.com/entry/2019/11/03/190519
