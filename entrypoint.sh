#!/bin/sh
set -e

# PLUGIN_FOLDERS            -> folders to test
# PLUGIN_FILTER             -> regex to filter which tests to run
# PLUGIN_CONFIG             -> path to phpunit.xml or phpunit.xml.dist
# PLUGIN_GROUP              -> run only tests from a group
# PLUGIN_EXCLUDE_GROUP      -> exclude tests from a group
# PLUGIN_TESTSUITE          -> run only the specified testsuite
# PLUGIN_VERBOSE            -> verbose output (true/false)
# PLUGIN_STOP_ON_FAIL       -> stop on first failure (true/false)
# PLUGIN_COVERAGE           -> generate code coverage report (true/false)
# PLUGIN_COVERAGE_FORMAT    -> coverage report format (html/text/clover/xml/crap4j/php)
# PLUGIN_COVERAGE_OUTPUT    -> path to save coverage report
# PLUGIN_LOG_JUNIT          -> path to save JUnit XML log
# PLUGIN_FAIL_ON            -> fail on specific issues (warning/risky/incomplete/skipped)
# PLUGIN_REPEAT             -> number of times to repeat tests
# PLUGIN_RANDOM_ORDER       -> randomize test execution order (true/false)
# PLUGIN_SEED               -> seed for random order
# PLUGIN_BOOTSTRAP          -> path to bootstrap file
# PLUGIN_STRICT_COVERAGE    -> enable strict coverage checking (true/false)
# PLUGIN_TESTDOX            -> enable testdox output format (true/false)
# PLUGIN_LOG_TEAMCITY       -> path to save TeamCity log
# PLUGIN_NO_LOGGING         -> disable all logging (true/false)
# PLUGIN_PROCESS_ISOLATION  -> run each test in a separate process (true/false)
# PLUGIN_STOP_ON_DEFECT     -> stop on first defect (error/failure/warning) (true/false)
# PLUGIN_STOP_ON_ERROR      -> stop on first error (true/false)
# PLUGIN_STOP_ON_WARNING    -> stop on first warning (true/false)
# PLUGIN_STOP_ON_SKIPPED    -> stop on first skipped test (true/false)
# PLUGIN_STOP_ON_INCOMPLETE -> stop on first incomplete test (true/false)

ARGS=""

[ -n "$PLUGIN_CONFIG" ]        && ARGS="$ARGS --configuration $PLUGIN_CONFIG"
[ -n "$PLUGIN_FILTER" ]        && ARGS="$ARGS --filter $PLUGIN_FILTER"
[ -n "$PLUGIN_GROUP" ]         && ARGS="$ARGS --group $PLUGIN_GROUP"
[ -n "$PLUGIN_EXCLUDE_GROUP" ] && ARGS="$ARGS --exclude-group $PLUGIN_EXCLUDE_GROUP"
[ -n "$PLUGIN_TESTSUITE" ]     && ARGS="$ARGS --testsuite $PLUGIN_TESTSUITE"
[ "$PLUGIN_VERBOSE" = "true" ] && ARGS="$ARGS --verbose"
[ "$PLUGIN_STOP_ON_FAIL" = "true" ] && ARGS="$ARGS --stop-on-failure"
[ "$PLUGIN_COVERAGE" = "true" ] && ARGS="$ARGS --coverage-text" # Default to text for simplicity
[ -n "$PLUGIN_COVERAGE_FORMAT" ] && ARGS="$ARGS --coverage-$PLUGIN_COVERAGE_FORMAT"
[ -n "$PLUGIN_COVERAGE_OUTPUT" ] && ARGS="$ARGS --coverage-$PLUGIN_COVERAGE_FORMAT=$PLUGIN_COVERAGE_OUTPUT"
[ -n "$PLUGIN_LOG_JUNIT" ]     && ARGS="$ARGS --log-junit $PLUGIN_LOG_JUNIT"
[ -n "$PLUGIN_FAIL_ON" ]       && ARGS="$ARGS --fail-on-$PLUGIN_FAIL_ON"
[ -n "$PLUGIN_REPEAT" ]        && ARGS="$ARGS --repeat $PLUGIN_REPEAT"
[ "$PLUGIN_RANDOM_ORDER" = "true" ] && ARGS="$ARGS --random-order"
[ -n "$PLUGIN_SEED" ]         && ARGS="$ARGS --random-order-seed $PLUGIN_SEED"
[ -n "$PLUGIN_BOOTSTRAP" ]    && ARGS="$ARGS --bootstrap $PLUGIN_BOOTSTRAP"
[ "$PLUGIN_STRICT_COVERAGE" = "true" ] && ARGS="$ARGS --strict-coverage"
[ "$PLUGIN_TESTDOX" = "true" ] && ARGS="$ARGS --testdox"
[ -n "$PLUGIN_LOG_TEAMCITY" ]  && ARGS="$ARGS --log-teamcity $PLUGIN_LOG_TEAMCITY"
[ "$PLUGIN_NO_LOGGING" = "true" ] && ARGS="$ARGS --no-logging"
[ "$PLUGIN_PROCESS_ISOLATION" = "true" ] && ARGS="$ARGS --process-isolation"
[ "$PLUGIN_STOP_ON_DEFECT" = "true" ] && ARGS="$ARGS --stop-on-defect"
[ "$PLUGIN_STOP_ON_ERROR" = "true" ] && ARGS="$ARGS --stop-on-error"
[ "$PLUGIN_STOP_ON_WARNING" = "true" ] && ARGS="$ARGS --stop-on-warning"
[ "$PLUGIN_STOP_ON_SKIPPED" = "true" ] && ARGS="$ARGS --stop-on-skipped"
[ "$PLUGIN_STOP_ON_INCOMPLETE" = "true" ] && ARGS="$ARGS --stop-on-incomplete"

if [ -n "$PLUGIN_FOLDERS" ]; then
    echo "Running PHPUnit on: $PLUGIN_FOLDERS"
    vendor/bin/phpunit $ARGS $PLUGIN_FOLDERS
else
    echo "Running PHPUnit on all tests"
    vendor/bin/phpunit $ARGS
fi