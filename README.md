
<h3 align="left">
    <p>😄 This repository provides some useful snippets that you may need in some situations.</p>
</h3>
 

## Some kind of snippets:

- [Bash snippets](bash/README.md)
- [Python snippets](python/README.md)

## Some interesting topics

- [Use Colab/Kaggle in VS Code]()
- [Connect to Linux server with Window terminal]()

## Citation

The code can be stolen from this repo without any permission and all contributors are welcome but you should refer the link to this repo in your code likes the following.
```bash
### in your ~/.bashrc file ###
# the code got from https://github.com/leminhnguyen/useful_snippets
sizeof(){
    # example: sizeof BOOK --> result: 895M    BOOK/
    du -h --max-depth=0 "$1"
}
```
