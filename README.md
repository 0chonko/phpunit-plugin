[![Docker Pulls](https://img.shields.io/docker/pulls/germanfak/phpunit-plugin)](https://hub.docker.com/r/germanfak/phpunit-plugin)
[![GitHub Release](https://img.shields.io/github/v/release/0chonko/phpunit-plugin)](https://github.com/0chonko/phpunit-plugin/releases)
[![License](https://img.shields.io/github/license/0chonko/phpunit-plugin)](LICENSE)

Here’s a clean `README.md` for your script so it’s understandable and easy to use in a Drone CI context:

---

# PHPUnit Drone CI Plugin

This is a simple Drone CI plugin for running PHPUnit tests with a wide range of configuration options via environment variables. Naturally, the image can be used for other use cases also where plug-and-play PHPUnit come in handy.

## Usage

Add the step to your `.drone.yml` pipeline:

```yaml
kind: pipeline
type: docker
name: testing
environment:
  XDEBUG_MODE: coverage
steps:
  - name: phpunit
    image: ghcr.io/0chonko/phpunit-plugin:latest
    settings:
      run_test: tests
      config: phpunit.xml
      verbose: true
      stop_on_fail: true
      coverage: true
      coverage_format: clover
      coverage_output: coverage.xml
```

The plugin will change into the repository root (`/drone/src`) and execute `phpunit` with the given options.

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


