# roku-convert
Convert videos to Roku-compatible h.264 AAC videos

- FFMPEG preset from:
  https://gist.github.com/brookemckim/1015107
- Requires: FFMPEG, -vcodec libx264, -acodec aac

## Usage
```bash
# Install libx264-roku.ffpreset to ~/.ffmpeg
roku-convert.sh install <path>

# Convert a video to h.264 AAC
roku-convert.sh video.mp4 <output/path>
```
