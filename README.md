# Max Anurin's website
https://www.anurin.name

## Development

### Jekyll via Docker
1. Build the site and make it available on a local server inside [Docker](https://www.docker.com/)
  ```bash
  docker run --interactive --rm --volume ${PWD}:/data --publish 4000:4000 zxteamorg/jekyll:20220717
  ```
1. Browse to http://127.0.0.1:4000

### Jekyll local
1. Install Jekyll. See https://jekyllrb.com/docs/
1. Build the site and make it available on a local server
	```bash
	cd docs
	bundle install
	bundle exec jekyll serve --host 127.0.0.1 --port 4000
	```
1. Browse to http://127.0.0.1:4000
