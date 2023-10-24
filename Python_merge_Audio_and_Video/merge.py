from moviepy.editor import VideoFileClip, AudioFileClip, concatenate_videoclips
import os

import sys

# main
title = ""
try:
    title = sys.argv[1].replace(sys.argv[0],"",1)
except:
    title = input("you need to give a name of the sketch: -")

    
# Open the video and audio
try:
    video_clip = VideoFileClip(f"../Exports/{title}V.mp4")
    audio_clip = AudioFileClip(f"../Exports/{title}A.wav")
except:
    print(f"wrong name of file {title}")
    exit()
# Concatenate the video clip with the audio clip
final_clip = video_clip.set_audio(audio_clip)

# Export the final video with audio
final_clip.write_videofile(f"../Exports/readyToUpload_{title}.mp4")