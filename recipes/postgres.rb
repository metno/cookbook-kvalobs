#
# Copyright (C) 2015 MET Norway
#
# All rights reserved - Do Not Redistribute
#

# PostgreSQL won't start if kernel.shmmax < shared_buffers, so we set it to
# half of total available memory on the box. Also, kernel.shmall needs a
# corresponding value. shmall is measured in pages, which is assumed to be 4 kB.
#
# According to the PostgreSQL documentation:
# http://www.postgresql.org/docs/9.4/static/kernel-resources.html
#
# SHMMAX    Maximum size of shared memory segment (bytes).
#           at least several megabytes (see text)
# SHMALL    Total amount of shared memory available (bytes or pages).
#           if bytes, same as SHMMAX; if pages, ceil(SHMMAX/PAGE_SIZE)
mem = node['memory']['total'].split("kB")[0].to_i * 1024
shmmax = mem / 2
shmall = shmmax / 4096
node.default['sysctl']['params']['kernel']['shmmax'] = shmmax
node.default['sysctl']['params']['kernel']['shmall'] = shmall
include_recipe "sysctl::apply"

# Install the PostgreSQL server and tune the configuration.
include_recipe "postgresql::server"
include_recipe "postgresql::client"
include_recipe "postgresql::config_pgtune"
