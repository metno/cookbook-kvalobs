#!/usr/bin/env bats

@test "postgres is running" {
      run pgrep postgres
      [ "$status" -eq 0 ]
}

@test "can connect with psql" {
    run sudo -u postgres psql -d postgres -c 'select true'
    [ $status -eq 0 ]
}

@test "postgres is version 9.4" {
    # Show server_version; truncate to major.minor version number
    version=$(sudo -u postgres psql -d postgres -c 'SHOW server_version' -t | egrep -o '[0-9]{1,}\.[0-9]{1,}')
    [ "$version" = "9.4" ]
}
