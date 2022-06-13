import os
import cv2


from tqdm import tqdm
from datetime import timedelta


def format_timedelta(td):
    """Utility function to format timedelta objects in a cool way (e.g 00:00:20.05) 
    omitting microseconds and retaining milliseconds"""
    result = str(td)
    try:
        result, ms = result.split(".")
    except ValueError:
        return (result + ".00").replace(":", "-")
    ms = int(ms)
    ms = round(ms / 1e4)
    return f"{result}.{ms:02}".replace(":", "-")


def video_to_images(video_file:str):
    cap = cv2.VideoCapture(video_file)
    fps = round(cap.get(cv2.CAP_PROP_FPS))

    count = 0
    files_list:list = list()
    file_name = video_file.split("/")[-1][:-4]

    while True:
        is_read, frame = cap.read()
        if not is_read:
            break
        frame_duration = count / fps


        frame_duration_formatted = format_timedelta(timedelta(seconds=frame_duration))
        cv2.imwrite(f"data/processed_data/{file_name}-frame_{frame_duration_formatted}.png", frame)
        files_list.append(f"data/processed_data/{file_name}-frame_{frame_duration_formatted}.png")
        count += 1

    return files_list, fps, file_name


def generate_video(files_list:list, path:str, video_file_name:str, FPS:int, save_frames:bool = False):
    
    video_name = f'{path}/{video_file_name}.mp4'
    print("Full video save to >>> ",video_name)
    frame = cv2.imread(files_list[0])
    fourcc = cv2.VideoWriter_fourcc(*'mp4v')
  
    height, width, layers = frame.shape  
  
    video = cv2.VideoWriter(video_name, fourcc, FPS, (width, height)) 
  
    for image in tqdm(files_list): 
        video.write(cv2.imread(image))

    if save_frames:
        for file in files_list:
            os.remove(file)
      
    video.release()