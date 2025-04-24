import os
import time
try:
    while True:
        os.system('rm -f *.jpg')
        os.system('rm -f *.h264')
        os.system('rm -f *.mp4')
        os.system('rpicam-jpeg -o $(date +"%Y-%m-%d").jpg --rotation 180')
        time.sleep(10)
        os.system('trap ctrl_c INT')
        os.system('rpicam-vid -t 15000 -o $(date +"%Y-%m-%d").h264 --rotation 180')
        os.system('ffmpeg -framerate 24 -i $(date +"%Y-%m-%d").h264 -c copy $(date +"%Y-%m-%d").mp4')
        os.system('gcloud config set project polar-winter-416516')
        time.sleep(30)
        os.system('gcloud storage cp $(date +"%Y-%m-%d").jpg gs://my-raspi-storage')
        os.system('gcloud storage cp $(date +"%Y-%m-%d").mp4 gs://my-raspi-storage')
except KeyboardInterrupt:
    print("\ndashcam stopped recording")