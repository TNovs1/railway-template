#!/bin/bash
set -e

if [ -n "$TAILSCALE_AUTHKEY" ]; then
echo "Starting Tailscale..."
tailscaled --state=/data/tailscale.state --socket=/var/run/tailscale/tailscaled.sock &
sleep 2
tailscale up --authkey="$TAILSCALE_AUTHKEY" --hostname=tclawd-railway --accept-routes
echo "Tailscale connected!"
fi

exec node src/server.js