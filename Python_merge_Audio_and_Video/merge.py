from moviepy.editor import VideoFileClip, AudioFileClip, concatenate_videoclips
import os

import sys

# main
title = ""
try:
    title = sys.argv[1]
except:
    input("you need to give an arugment: -name_of_sketch")
    exit()
    
# Open the video and audio
try:
    video_clip = VideoFileClip(f"../../Exports{title}V.mp4")
    audio_clip = AudioFileClip(f"../../Exports{title}A.wav")
except:
    input(f"wrong name of file {title}")
    exit()
# Concatenate the video clip with the audio clip
final_clip = video_clip.set_audio(audio_clip)

# Export the final video with audio
final_clip.write_videofile(f"../../Exports{title}.mp4")