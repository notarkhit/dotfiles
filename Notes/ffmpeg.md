
> wallpaper 

```bash

ffmpeg -i input.mp4 -c:v libwebp -vf "fps=10,scale=1920:-1" -lossless 0 -q:v 80 output.webp


```
