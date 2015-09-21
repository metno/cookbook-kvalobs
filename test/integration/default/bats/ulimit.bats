#!/usr/bin/env bats

@test "max number of open files for the kvalobs user is 8192" {
  run grep -E '^kvalobs[[:blank:]]+-[[:blank:]]+nofile[[:blank:]]+8192' /etc/security/limits.d/999-chef-ulimit.conf
  [ $status -eq 0 ]
}

@test "pam_limits.so is enabled in '/etc/pam.d/common-session'" {
  run  grep -E '^session[[:blank:]]+required[[:blank:]]+pam_limits.so' /etc/pam.d/common-session
  [ $status -eq 0 ]
}
