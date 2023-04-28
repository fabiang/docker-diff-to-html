# fabiang/diff-to-html

Display diffs in a convenient html page (Docker image). See https://github.com/cronn/diff-to-html for more details.

![[Docker Hub](https://hub.docker.com/r/fabiang/diff-to-html)](https://dockerico.blankenship.io/image/fabiang/diff-to-html)

## Usage

```
docker run -it --rm -w /src -v "$PWD/:/src" fabiang/diff-to-html diff-to-html file1 file2
```
