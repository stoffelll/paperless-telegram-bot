#!/bin/bash

echo "=== DEBUG INFO ==="
echo "Current user: $(whoami)"
echo "User ID: $(id)"
echo "=== /data/ contents ==="
ls -la /data/ 2>&1 || echo "/data/ does not exist"
echo "=== /data/options.json ==="
ls -la /data/options.json 2>&1 || echo "options.json not found"
cat /data/options.json 2>&1 || echo "Cannot read options.json"
echo "=== /etc/passwd users ==="
cat /etc/passwd
echo "=== ENV ==="
env
echo "=== END DEBUG ==="

sleep 300
