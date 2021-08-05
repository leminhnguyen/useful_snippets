
<h3 align="center">
    <p>This repository provides some snippets which you may find something usefully for doing your jobs.</p>
</h3>
 

## Some kind of snippets:

- [Bash snippets](bash/README.md)
- [Python snippets](python/README.md)

## Citation

The code can be stolen from this repo without any permission and every contributors are welcome but you should refer the link to this repo in your code likes the following.
```bash
### in your ~/.bashrc file ###
# the code got from https://github.com/leminhnguyen/useful_snippets
sizeof(){
    # example: sizeof BOOK --> result: 895M    BOOK/
    du -h --max-depth=0 "$1"
}
```
