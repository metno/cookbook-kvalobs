#!/usr/bin/env bats

@test "That the firewall is enabled" {
    ufw status | {
        run  grep -E '^Status: +active'
        [ $status -eq 0 ]
    }
}

@test "That the firewall is open for trafic from met.no" {
    ufw status | {
        run  grep -E '^Anywhere +ALLOW +157.249.0.0/16/tcp'
        [ $status -eq 0 ]
    }
}
