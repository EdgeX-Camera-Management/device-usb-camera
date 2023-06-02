#!/usr/bin/dumb-init /bin/sh
# shellcheck shell=sh

# ENABLE_RTSP_SERVER is set to 'true' by default. If it has
# been set to anything else, the rtsp server will not be started
ENABLE_RTSP_SERVER="${ENABLE_RTSP_SERVER:-true}"

if [ "$ENABLE_RTSP_SERVER" = "true" ]; then
  echo "Run rtsp-simple-server..."
  /rtsp-simple-server &
else
  echo "RTSP server is disabled."
fi

echo "Run device-usb-camera..."
/device-usb-camera "$@"
