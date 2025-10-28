# Content Of My Landing Site

See [https://www.anurin.name](https://www.anurin.name)

## Development

```shell
docker run --interactive --rm --publish 127.0.0.1:4000:4000 --publish 127.0.0.1:4001:4001 --workdir "${PWD}" \
  --mount type=bind,source="${PWD}",target="${PWD}" --volume name-anurin-me-bundle-data:"${PWD}/vendor/bundle" \
  theanurin/jekyll:4.3.4-02
```

Browse to http://127.0.0.1:4000

## Setup Development Environment

Note: This repository uses Git Large File Storage (Git LFS) to store large binary files. See details in separate [document](./LFS.md)

```shell
git lfs install # required once per machine
git clone -b dev git@github.com:theanurin/me.git theanurin-me
cd theanurin-me
git submodule update --init
```

## References

- My Jekyll Theme - [jekyll-theme-anurina](https://github.com/theanurin/jekyll-theme-anurina)
- Base Jekyll Theme - https://github.com/Stavrospanakakis/jekyll-cv
- [https://github.com/pavlovalor](Pavló Valor)
- Wikipedia [Résumé](https://en.wikipedia.org/wiki/R%C3%A9sum%C3%A9)