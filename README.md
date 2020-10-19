# Contains my personal snippets

### 1. Count the number of files in a folder (place the function in ~/.bashrc)
```bash
fcount() { ls -1q "$1" | wc -l; }
```
- For example: `fcount /home/nguyenlm/wavs` => 27


### 2. Fix cuda remove completely problem
```bash
sudo apt-get -o Dpkg::Options::="--force-overwrite" install --fix-broken
```

### 3. Count the number of non-blank lines in the files
```bash
nbl-count() = { grep -cve '^\s*$' "$1" }
```
- For example: `nbl-count file.txt` => 10

### 4. Fix run docker without sudo
```bash
sudo chmod 666 /var/run/docker.sock
```

### 5. Fix 2nd screen cannot be detected when reinstalling ubuntu
```bash
sudo apt-get purge 'nvidia*'
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update
sudo ubuntu-drivers autoinstall
```

### 6. Install mysql and mysql workbench
```bash
sudo apt update
sudo apt install mysql-workbench
```

### 7. Fix Invalid MIT-MAGIC-COOKIE-1 keyUnable to init server and javafx Caused by: java.lang.UnsupportedOperationException: Unable to open DISPLAY
- reference: [this link](https://bbs.archlinux.org/viewtopic.php?id=230828)

```bash
who -> user :1  2017-10-12 21:58 (:1)
```
> Yeah, the reason is that you're on DISPLAY :1.0 - no idea why your environment variable is borked
```bash
export DISPLAY=:1.0
zenity --info --text foobar
```
> Check your profile files and bashrc (or zshrc or whatever) and /etc/environment and DE environment configuration - somewhere this will be falsely exported.

### 8. Get size of folder
```bash
sizeof(){
    # example: sizeof BOOK --> result: 895M    BOOK/
    du -h --max-depth=0 "$1"
}
```