# Contains my personal snippets

## 1. Count the number of files in a folder
For example: `fcount /home/nguyenlm/wavs --> 27`

```bash
fcount() { ls -1q "$1" | wc -l; }
```


## 2. Fix cuda remove completely problem

```sh
sudo apt-get -o Dpkg::Options::="--force-overwrite" install --fix-broken
```

## 3. Count the number of non-blank lines in the files
For example: `nbl-count file.txt --> 10`

```bash
nbl-count() = { grep -cve '^\s*$' "$1" }
```

## 4. Run docker without sudo

```bash
sudo chmod 666 /var/run/docker.sock
```

## 5. Fix 2nd screen cannot be detected when reinstalling ubuntu

```bash
sudo apt-get purge 'nvidia*'
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update
sudo ubuntu-drivers autoinstall
```

## 6. Fix Invalid MIT-MAGIC-COOKIE-1 keyUnable to init server and javafx
Caused by: *java.lang.UnsupportedOperationException: Unable to open DISPLAY <br/>*
Reference: [this link](https://bbs.archlinux.org/viewtopic.php?id=230828)

```bash
who -> user :1  2017-10-12 21:58 (:1)
```
> Yeah, the reason is that you're on DISPLAY :1.0 - no idea why your environment variable is borked
```bash
export DISPLAY=:1.0
zenity --info --text foobar
```
> Check your profile files and bashrc (or zshrc or whatever) and /etc/environment and DE environment configuration - somewhere this will be falsely exported.

## 7. Get size of folder
For example: `example: sizeof BOOK --> result: 895M    BOOK/`

```bash
sizeof(){
    du -h --max-depth=0 "$1"
}
```

## 8. Rsync from local to remote
Reference: [Rsync Command in Linux - Linuxize](https://linuxize.com/post/how-to-use-rsync-for-local-and-remote-data-transfer-and-synchronization/) <br/>
Note:      can run with `-n` option for the sake of safety
```bash
rsync -aPz -e "ssh -p port" local_folder/ user@remote_host:remote_folder
```

## 9. Find and kill specific processes
Note: `[p]` means we do not kill grep process itself

```bash
kill $(ps aux | grep '[p]rocess.py' | awk '{print $2}')
```

## 10. Recover the lost tmux session

```bash
pkill -USR1 tmux
```
