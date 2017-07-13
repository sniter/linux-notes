# VLC

# Open RTP Stream

```shell
vlc -vvv ${INPUT_FILE} --sout '#rtp{dst=${YOUR_HOST},port=5000,sdp=rtsp://${YOUR_HOST}:5005/vlc.sdp}'
```

# Listen RTP Stream

```shell
vlc rtsp://${YOUR_HOST}:5005/vlc.sdp
```