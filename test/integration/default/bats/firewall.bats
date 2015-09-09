#!/usr/bin/env bats

@test "That the firewall is disabled" {
    ufw status | {
        run  grep -E '^Status: +inactive'
        [ $status -eq 0 ]
    }
}
