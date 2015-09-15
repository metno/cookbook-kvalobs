#!/usr/bin/env bats

@test "That the firewall is disabled" {
    ufw status | {
        run  grep -E '^Status: +active'
        [ $status -eq 0 ]
    }
}
