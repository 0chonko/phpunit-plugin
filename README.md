[![Docker Pulls](https://img.shields.io/docker/pulls/germanfak/phpunit-plugin)](https://hub.docker.com/r/germanfak/phpunit-plugin)
[![GitHub Release](https://img.shields.io/github/v/release/0chonko/phpunit-plugin)](https://github.com/0chonko/phpunit-plugin/releases)

---

# PHPUnit Drone CI Plugin

This is a simple Drone CI plugin for running PHPUnit tests with a wide range of configuration options via environment variables. Naturally, the image can be used for other use cases also where plug-and-play PHPUnit come in handy.

The source release is [1.0.0](https://github.com/0chonko/phpunit-plugin/releases/tag/1.0.0). The example pins the published Docker Hub image by digest.

## Runtime versions

The image bundles PHP 8.2 CLI, PHPUnit 11.5, and Xdebug. Use PHPUnit 11-compatible tests and configuration.

## Usage

Add the step to your `.drone.yml` pipeline:

```yaml
kind: pipeline
type: docker
name: testing
steps:
  - name: phpunit
    image: germanfak/phpunit-plugin@sha256:896703686ac67e7565509f6c4de21f92f97dab845506eca4bb3620bcf61b1c82
    settings:
      folders: /drone/src/tests
      config: /drone/src/phpunit.xml
      stop_on_fail: true
```

Drone mounts the checkout at `/drone/src`. Use absolute paths to the checkout with this image so PHPUnit can find the configuration and test files.

---

## Environment Variables / Settings

| Variable                    | Description                                                   |
| --------------------------- | ------------------------------------------------------------- |
| `PLUGIN_RUN_TEST`           | Target test(s) to run.                                        |
| `PLUGIN_CONFIG`             | PHPUnit configuration file.                                   |
| `PLUGIN_FILTER`             | Filter which tests to run by name.                            |
| `PLUGIN_GROUP`              | Only run tests from the given group.                          |
| `PLUGIN_EXCLUDE_GROUP`      | Exclude tests from the given group.                           |
| `PLUGIN_TESTSUITE`          | Run tests from the specified testsuite.                       |
| `PLUGIN_VERBOSE`            | `true` for verbose output.                                    |
| `PLUGIN_STOP_ON_FAIL`       | `true` to stop on first failure.                              |
| `PLUGIN_COVERAGE`           | `true` to show coverage in text output.                       |
| `PLUGIN_COVERAGE_FORMAT`    | Coverage format (e.g. `clover`, `html`).                      |
| `PLUGIN_COVERAGE_OUTPUT`    | Output file/path for coverage report.                         |
| `PLUGIN_LOG_JUNIT`          | Path to write JUnit XML log.                                  |
| `PLUGIN_FAIL_ON`            | Set PHPUnit fail-on-\* option (e.g. `incomplete`, `skipped`). |
| `PLUGIN_REPEAT`             | Number of times to repeat tests.                              |
| `PLUGIN_RANDOM_ORDER`       | `true` to run tests in random order.                          |
| `PLUGIN_SEED`               | Seed for random order.                                        |
| `PLUGIN_BOOTSTRAP`          | Path to bootstrap PHP file.                                   |
| `PLUGIN_STRICT_COVERAGE`    | `true` to enable strict coverage mode.                        |
| `PLUGIN_TESTDOX`            | `true` to use TestDox output format.                          |
| `PLUGIN_LOG_TEAMCITY`       | Path for TeamCity log output.                                 |
| `PLUGIN_NO_LOGGING`         | `true` to disable logging.                                    |
| `PLUGIN_PROCESS_ISOLATION`  | `true` to run each test in a separate PHP process.            |
| `PLUGIN_STOP_ON_DEFECT`     | Stop on first defect.                                         |
| `PLUGIN_STOP_ON_ERROR`      | Stop on first error.                                          |
| `PLUGIN_STOP_ON_WARNING`    | Stop on first warning.                                        |
| `PLUGIN_STOP_ON_SKIPPED`    | Stop on first skipped test.                                   |
| `PLUGIN_STOP_ON_INCOMPLETE` | Stop on first incomplete test.                                |
| `PLUGIN_FOLDERS`            | Specific folder(s) to run tests in.                           |


