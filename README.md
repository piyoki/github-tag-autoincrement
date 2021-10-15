# github-tag-autoincrement

auto-increment semantic version (semver) patch and add a github tag

## Introduction

This light-weight Docker image is targeting a very primal need: a CI-CD pipeline hook-able docker image, which will auto-increment patch version `(Semantic Versioning)` without any other libraries in your codebase. For example, You can hook up this image in your `CICD` chain so that it will be invoked for each commit to master. By doing so, you can convert cryptic and hard-to-remember commit SHAs to nice `auto-incrementable` semver tags, for example v0.0.1.

This Docker image is intended to use with your CICD pipeline (Jenkins, Tekton) and it addresses these 2 issues

1. Including a library/plugin/task-library just to `auto-increment` your patch version and creating tag in your codebase which has nothing to do with your business functionality.
2. Manually upgrading the version of your codebase or Manually creating a Tag when the above-said libraries are not available in your choice of programming language.

## Usage

```bash
docker run \
     -e "GITHUB_API_REPO_URL=https://api.github.com/repos/so-random-dude/oneoffcodes" \
     -e "TAG_PREFIX=v" \
     -e "GITHUB_USERNAME=<YOURUSERNAME>" \
     -e "GITHUB_PASSWORD=<YOURPASSWORD>" \
     jaisonpjohn/github-tag-autoincrement
```

If you just need to know the version in making so that you can tag your artifact with that version before you push to your Artifactory (Dockerhub / JFrog Artifactory / ECR / GCR etc), just add "MODE=READONLY"

```bash
docker run \
     -e "GITHUB_API_REPO_URL=https://api.github.com/yqlbu/github-tag-autoincrement" \
     -e "TAG_PREFIX=v" \
     -e "GITHUB_USERNAME=<YOURUSERNAME>" \
     -e "GITHUB_PASSWORD=<YOURPASSWORD>" \
     -e "COMMIT_MESSAGE=<MESSAGE>" \
     -e "MODE=READONLY" \
     ghcr.io/yqlbu/github-tag-autoincrement
```
