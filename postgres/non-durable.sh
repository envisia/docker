#!/bin/bash
set -e

cat <<EOT >> /var/lib/postgresql/data/postgresql.conf
fsync = off                     # flush data to disk for crash safety
synchronous_commit = off        # synchronization level;
full_page_writes = off          # recover from partial page writes
max_wal_size = 5GB
checkpoint_timeout = 1d         # range 30s-1d
EOT
