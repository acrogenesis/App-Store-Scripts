# iOS Simulator Media Processing Scripts

A collection of bash scripts for processing iOS Simulator screenshots and app preview videos for App Store submissions. These scripts help automate the cleanup of simulator screenshots by removing simulator UI elements, and ensure videos meet App Store Connect requirements.

## Prerequisites

These scripts require the following dependencies:
- `ImageMagick` - for image processing tasks
- `ffmpeg` - for video and audio processing tasks

## Scripts

### crop-ios.sh
Crops iOS Simulator screenshots to remove simulator UI elements.

```bash
./crop-ios.sh directory
```
- Takes a directory as input
- Processes all image files (jpg, jpeg, png, gif)
- Crops images to 988x1990 pixels from the south gravity point to isolate just the device screen
- Saves cropped images with "_cropped" suffix
- Useful for cleaning up simulator screenshots before processing them for App Store submission

### crop-ipad.sh
Crops iPad Simulator screenshots to remove simulator UI elements.

```bash
./crop-ipad.sh directory
```
- Takes a directory as input
- Processes all image files (jpg, jpeg, png, gif)
- Crops images to 971x1250 pixels from the south gravity point to isolate just the device screen
- Overwrites original files with cropped versions
- Useful for cleaning up simulator screenshots before processing them for App Store submission

### fix-audio.sh
Fixes app preview videos to meet App Store Connect audio requirements by ensuring a valid audio track.

```bash
./fix-audio.sh input_file
```
- Takes a video file as input
- Adds a silent stereo audio track (44.1kHz) if no audio track exists
- Preserves original video quality
- Overwrites the original file
- Ensures videos meet Apple's audio requirements for app previews

### fps-30.sh
Converts app preview videos to 30 FPS to meet App Store Connect requirements.

```bash
./fps-30.sh input_file
```
- Takes a video file as input
- Converts the video to 30 FPS (required by App Store Connect)
- Preserves original audio
- Creates new file with "_30fps" suffix
- Ensures videos meet Apple's frame rate requirements for app previews

### make_gif.sh
Creates an animated GIF from a directory of PNG images.

```bash
./make_gif.sh directory
```
- Takes a directory of PNG images as input
- Randomizes image sequence
- Creates GIF with 2.5 FPS
- Optimizes color palette for better quality
- Saves output as "output.gif" in parent directory

## Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/media-processing-scripts.git
```

2. Install dependencies (Ubuntu/Debian):
```bash
sudo apt-get update
sudo apt-get install imagemagick ffmpeg
```

## Processing Tips

- Screenshot cropping scripts are specifically for cleaning up iOS/iPad Simulator screenshots
- The cropping dimensions are set to remove simulator UI while preserving the device screen content
- App preview videos processed with these scripts will meet App Store requirements for frame rate and audio
- Always verify the final assets meet App Store Connect requirements before submission

## Usage Tips

- All scripts include error checking for required arguments
- Keep backup copies of your files before processing
- The iOS and iPad cropping scripts assume specific screenshot dimensions
- For GIF creation, ensure source PNGs are in the desired order
- Videos processed with fix-audio.sh will have a silent audio track if none existed

## License

[MIT License](LICENSE.md)

## Contributing

1. Fork the repository
2. Create a new branch for your feature
3. Submit a pull request

## Support

For issues and feature requests, please use the GitHub issues tracker.