# 🐚 Bash Snippets

A collection of handy shell functions and one-liners. Add the functions to your `~/.bashrc` (or `~/.zshrc`) to use them anywhere.

---

## Table of Contents

1. [Count Files in a Folder](#1-count-files-in-a-folder)
2. [Fix CUDA Force-Overwrite Problem](#2-fix-cuda-force-overwrite-problem)
3. [Count Non-Blank Lines in a File](#3-count-non-blank-lines-in-a-file)
4. [Run Docker Without sudo](#4-run-docker-without-sudo)
5. [Fix 2nd Screen Not Detected](#5-fix-2nd-screen-not-detected)
6. [Fix Invalid MIT-MAGIC-COOKIE-1 / DISPLAY Error](#6-fix-invalid-mit-magic-cookie-1--display-error)
7. [Get Size of a Folder](#7-get-size-of-a-folder)
8. [Rsync from Local to Remote](#8-rsync-from-local-to-remote)
9. [Find and Kill Specific Processes](#9-find-and-kill-specific-processes)
10. [Download Multiple Files into a Folder](#10-download-multiple-files-into-a-folder)
11. [Recover a Lost tmux Session](#11-recover-a-lost-tmux-session)

---

## 1. Count Files in a Folder

```bash
fcount() { ls -1q "$1" | wc -l; }
```

**Usage:**

```bash
fcount /home/nguyenlm/wavs
# Output: 27
```

---

## 2. Fix CUDA Force-Overwrite Problem

When `apt` fails due to CUDA file conflicts:

```bash
sudo apt-get -o Dpkg::Options::="--force-overwrite" install --fix-broken
```

---

## 3. Count Non-Blank Lines in a File

```bash
nbl-count() { grep -cve '^\s*$' "$1"; }
```

**Usage:**

```bash
nbl-count file.txt
# Output: 10
```

---

## 4. Run Docker Without sudo

```bash
sudo chmod 666 /var/run/docker.sock
```

---

## 5. Fix 2nd Screen Not Detected

After reinstalling Ubuntu, if your second monitor is not detected:

```bash
sudo apt-get purge 'nvidia*'
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update
sudo ubuntu-drivers autoinstall
```

---

## 6. Fix Invalid MIT-MAGIC-COOKIE-1 / DISPLAY Error

**Error:** `java.lang.UnsupportedOperationException: Unable to open DISPLAY`

Reference: [ArchLinux forums](https://bbs.archlinux.org/viewtopic.php?id=230828)

Check which display you're on:

```bash
who
# user :1  2017-10-12 21:58 (:1)
```

Then export the correct display:

```bash
export DISPLAY=:1.0
zenity --info --text foobar
```

> Check `~/.bashrc`, `~/.zshrc`, `/etc/environment`, and your DE config for any incorrect `DISPLAY` exports.

---

## 7. Get Size of a Folder

```bash
sizeof() {
    du -h --max-depth=0 "$1"
}
```

**Usage:**

```bash
sizeof BOOK
# Output: 895M    BOOK/
```

---

## 8. Rsync from Local to Remote

Reference: [Rsync Command in Linux — Linuxize](https://linuxize.com/post/how-to-use-rsync-for-local-and-remote-data-transfer-and-synchronization/)

> Tip: use `-n` (dry-run) first to preview changes safely.

```bash
rsync -aPz -e "ssh -p <port>" local_folder/ user@remote_host:remote_folder
```

---

## 9. Find and Kill Specific Processes

> The `[p]` trick prevents `grep` from matching its own process.

```bash
kill $(ps aux | grep '[p]rocess.py' | awk '{print $2}')
```

---

## 10. Download Multiple Files into a Folder

Script: [`downloading.sh`](downloading.sh)

**Usage:**

```bash
bash downloading.sh -f my_folder -u https://example.com/file1.zip -u https://example.com/file2.zip
```

**Options:**

| Flag | Description |
|------|-------------|
| `-f` | Destination folder (created if it doesn't exist) |
| `-u` | URL to download |
| `-n` | Custom filename for the previous `-u` URL |
| `-h` | Show help message |

---

## 11. Recover a Lost tmux Session

```bash
pkill -USR1 tmux
```
