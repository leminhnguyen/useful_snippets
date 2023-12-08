# The table of contents
[1. Multiprocessing with `p_tqdm` library](#multiprocessing-with-p_tqdm-library)<br>
[2. Get audio duration very fast](#get-audio-duration-very-fast)<br>
[3. Use decorator to measure processing time of a function](#time-decorator)


<div id="multiprocessing-with-p_tqdm-library">

## 1. Multiprocessing with `p_tqdm` library

### Installation

````bash
pip install p_tqdm
````

### Example

````python
from scipy.io.wavfile import read
from p_tqdm import p_map, p_umap
import os
import pandas as pd

# defines the function which need to be processed in parallel
def process_wav(wav_path):
    sr, wav = read(wav_path)
    duration = len(wav)/sr
    return {
        "wav_path": wav_path,
        "duration": duration,
        "samplerate": sr
    }

# gets the list of audio paths
wav_dir = "/tmp/original_wavs"
wav_paths = [f"{wav_dir}/{file}" for file in os.listdir(wav_dir)]

### process in parallel and return the ordered results ###
ordered_results = p_map(process_wav, wav_paths, num_cpus=4)

### process in parallel and return the unordered results ###
unordered_results = p_umap(process_wav, wav_paths, num_cpus=4)

### in the process the progress bar will be printed ###
60%|████████████████████████            | 60/100 [00:02<00:01, 1.00s/it]

# convert the results to dataframe
pd.DataFrame(ordered_results)
````

| wav_path                      | duration | samplerate |
| ----------------------------- | -------- | ---------- |
| /tmp/original_wavs/audio1.wav | 12.0     | 16000      |
| /tmp/original_wavs/audio2.wav | 3.55     | 16000      |
| ...                           | ...      | ...        |

<div id="get-audio-duration-very-fast">

## 2. Get audio duration very fast
We will use a built-in module called `wave` to read the audio header only to get metadata.

### Example
````python
import wave

def get_duration(wav_file):
    wav = wave.open(wav_file) 
    sample_rate = wav.getframerate()
    nframes = wav.getnframes()
    return round(nframes/rate, 2)

print(get_duration("/tmp/test.wav")) # 3.21s
````

<div id="time-decorator">

## 3. Use decorator to measure processing time of a function

### Example
````python
import time, random as rd

def time_decorator(function):
    def wrapper(*args, **kwargs):
        stime = time.time()
        result = function(*args, **kwargs)
        process_time = time.time() - stime
        print(f"{function.__name__} taken time: {process_time} ms")
        return result
    return wrapper 

@time_decorator
def process():
  total = 0
  for i in range(rd.randint(10000, 10_000_000)):
      total += i
  return total

# process taken time: 0.6141083240509033 ms
process()
````