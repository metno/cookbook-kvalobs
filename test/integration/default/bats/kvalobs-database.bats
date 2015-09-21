#!/usr/bin/env bats

@test "database exists" {
    run su postgres -c "psql -lqt | cut -d \| -f 1 | grep -qw kvalobs"
    [ "$status" -eq 0 ]
}

@test "database user exists" {
    run su postgres -c "psql -lqtc \"select count(*) FROM pg_roles WHERE rolname='kvproc'\" | grep -q 1"
    [ "$status" -eq 0 ]
}

@test "schema seems sane" {
    run su postgres -c "psql --set=ON_ERROR_STOP=true kvalobs -c 'SELECT * FROM param LIMIT 1'"
    [ "$status" -eq 0 ]
}
