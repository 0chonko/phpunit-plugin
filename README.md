[![Docker Pulls](https://img.shields.io/docker/pulls/germanfak/phpunit-plugin)](https://hub.docker.com/r/germanfak/phpunit-plugin)
[![GitHub Release](https://img.shields.io/github/v/release/0chonko/phpunit-plugin)](https://github.com/0chonko/phpunit-plugin/releases)
[![License](https://img.shields.io/github/license/0chonko/phpunit-plugin)](LICENSE)


````markdown
# PHPUnit Runner (Drone CI Plugin)

A minimal Docker image for running PHPUnit tests in **Drone CI** with optional folder selection via `settings`.

## Usage in Drone CI

Example `.drone.yml`:

```yaml
kind: pipeline
type: docker
name: test

steps:
  - name: phpunit-tests
    image: germanfak/phpunit-plugin
    settings:
      folders:
        - tests/Feature
        - tests/Unit
````

* `settings.folders` maps to the environment variable `PLUGIN_FOLDERS` inside the container.
* If `folders` is omitted, all PHPUnit tests will run.

---

## Local Testing

### 1. Build the image

```bash
docker build -t phpunit-runner .
```

### 2. Run all tests

```bash
docker run --rm -v $(pwd):/app phpunit-runner
```

### 3. Run specific test folders (simulating Drone `settings`)

```bash
docker run --rm \
    -v $(pwd):/app \
    -e PLUGIN_FOLDERS="tests/Feature tests/Unit" \
    phpunit-runner
```

