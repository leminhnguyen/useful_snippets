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