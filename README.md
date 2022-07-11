# docker-diff-to-html

Display diffs in a convenient html page (Docker image)

[Docker Hub](https://hub.docker.com/repository/docker/fabiang/diff-to-html)

## Usage

```
docker run -it --rm -w /src -v "$PWD/:/src" fabiang/diff-to-html diff-to-html file1 file2
```
