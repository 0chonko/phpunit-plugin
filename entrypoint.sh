#!/bin/sh
set -e

TARGET_TESTS=${PLUGIN_RUN_TEST}

cd /drone/src

ARGS=""

[ -n "$PLUGIN_CONFIG" ]        && ARGS="$ARGS --configuration $PLUGIN_CONFIG"
[ -n "$PLUGIN_FILTER" ]        && ARGS="$ARGS --filter $PLUGIN_FILTER"
[ -n "$PLUGIN_GROUP" ]         && ARGS="$ARGS --group $PLUGIN_GROUP"
[ -n "$PLUGIN_EXCLUDE_GROUP" ] && ARGS="$ARGS --exclude-group $PLUGIN_EXCLUDE_GROUP"
[ -n "$PLUGIN_TESTSUITE" ]     && ARGS="$ARGS --testsuite $PLUGIN_TESTSUITE"
[ "$PLUGIN_VERBOSE" = "true" ] && ARGS="$ARGS --verbose"
[ "$PLUGIN_STOP_ON_FAIL" = "true" ] && ARGS="$ARGS --stop-on-failure"
[ "$PLUGIN_COVERAGE" = "true" ] && ARGS="$ARGS --coverage-text"
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
    phpunit $ARGS $PLUGIN_FOLDERS
else
    phpunit $ARGS
fi