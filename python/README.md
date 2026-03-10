# 🐍 Python Snippets

Reusable Python patterns and utilities for common development tasks.

---

## Table of Contents

1. [Multiprocessing with `p_tqdm`](#1-multiprocessing-with-p_tqdm)
2. [Get Audio Duration Very Fast](#2-get-audio-duration-very-fast)
3. [Time Decorator](#3-time-decorator)
4. [Fix Google Drive Download Permission](#4-fix-google-drive-download-permission)

---

## 1. Multiprocessing with `p_tqdm`

Run functions in parallel across a list with a built-in progress bar.

### Installation

```bash
pip install p_tqdm
```

### Example

```python
from scipy.io.wavfile import read
from p_tqdm import p_map, p_umap
import os
import pandas as pd

def process_wav(wav_path):
    sr, wav = read(wav_path)
    return {
        "wav_path": wav_path,
        "duration": len(wav) / sr,
        "samplerate": sr,
    }

wav_dir = "/tmp/original_wavs"
wav_paths = [f"{wav_dir}/{f}" for f in os.listdir(wav_dir)]

# Ordered results (preserves input order)
ordered_results = p_map(process_wav, wav_paths, num_cpus=4)

# Unordered results (faster, no order guarantee)
unordered_results = p_umap(process_wav, wav_paths, num_cpus=4)

# Progress bar is printed automatically during processing:
# 60%|████████████████████████            | 60/100 [00:02<00:01, 1.00s/it]

pd.DataFrame(ordered_results)
```

**Output:**

| wav_path                      | duration | samplerate |
| ----------------------------- | -------- | ---------- |
| /tmp/original_wavs/audio1.wav | 12.0     | 16000      |
| /tmp/original_wavs/audio2.wav | 3.55     | 16000      |
| ...                           | ...      | ...        |

---

## 2. Get Audio Duration Very Fast

Uses Python's built-in `wave` module to read only the audio header — no full decoding needed.

```python
import wave

def get_duration(wav_file):
    with wave.open(wav_file) as wav:
        sample_rate = wav.getframerate()
        nframes = wav.getnframes()
    return round(nframes / sample_rate, 2)

print(get_duration("/tmp/test.wav"))  # 3.21
```

---

## 3. Time Decorator

Wrap any function to automatically print its execution time.

```python
import time
import random as rd

def time_decorator(function):
    def wrapper(*args, **kwargs):
        start = time.time()
        result = function(*args, **kwargs)
        elapsed = time.time() - start
        print(f"{function.__name__} took {elapsed:.4f}s")
        return result
    return wrapper

@time_decorator
def process():
    total = 0
    for i in range(rd.randint(10_000, 10_000_000)):
        total += i
    return total

process()
# process took 0.6141s
```

---

## 4. Fix Google Drive Download Permission

**Problem:** `gdown` fails with "Permission denied" even when the file is set to "Anyone with the link".

**Fix:**

```python
# In Kaggle / Colab notebook:
!pip install --upgrade --no-cache-dir gdown

import gdown

file_id = "1N3-c-IzIqYNB53ojvZKkEEMO0c7eEQZQ"
gdown.download(id=file_id, output="output_file.zip", quiet=False)
```
url = f"https://drive.google.com/uc?export=download&id={file_id}&confirm=t"
output = 'out.zip' 
gdown.download(url, output, quiet=False)
```