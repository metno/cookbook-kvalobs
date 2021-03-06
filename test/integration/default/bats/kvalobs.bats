#!/usr/bin/env bats

@test "kvQabased is running" {
      run pgrep kvQabased
      [ "$status" -eq 0 ]
}

@test "kvManagerd is running" {
      run pgrep kvManagerd
      [ "$status" -eq 0 ]
}

@test "kvDataInputd is running" {
      run pgrep kvDataInputd
      [ "$status" -eq 0 ]
}

@test "kvServiced is running" {
      run pgrep kvServiced
      [ "$status" -eq 0 ]
}

@test "norcom2kv is running" {
      run pgrep norcom2kv
      [ "$status" -eq 0 ]
}

@test "kvbufrd is running" {
      run pgrep kvbufrd
      [ "$status" -eq 0 ]
}
@test "kvsynopd is running" {
      run pgrep kvsynopd
      [ "$status" -eq 0 ]
}

@test "kvAgregated is running" {
      run pgrep kvAgregated
      [ "$status" -eq 0 ]
}

@test "kvAgregated managed to create database" {
      run su kvalobs -c "test -w /var/lib/kvagregated/database.sqlite"
      [ "$status" -eq 0 ]
}



@test "kvalobs.conf exists" {
      run ls /etc/kvalobs/kvalobs.conf
      [ "$status" -eq 0 ]
}

@test "kv_ctl.conf exists" {
      run ls /etc/kvalobs/kv_ctl.conf
      [ "$status" -eq 0 ]
}
