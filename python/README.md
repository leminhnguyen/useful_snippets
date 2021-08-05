## The table of contents

1. [Process data in parallel with multi-processing](#multiprocessing)

<a name="multiprocessing"></a>
## Multiprocessing with `p_tqdm` library

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

| wav_path  | duration | samplerate
| ------------- | ------------- | -------------
| /tmp/original_wavs/audio1.wav  | 12.0  | 16000  |
| /tmp/original_wavs/audio2.wav  | 3.55  | 16000  |
| ...  | ...  | ...  |


