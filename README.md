# HED

- Original code from https://github.com/ppwwyyxx/tensorpack/tree/master/examples/HED


### Requirements
* Download pre-trained model `HED_pretrained_bsds.npy` into `src/`.
 - The model trained by ppwwyyxx can be downloaded [here](https://drive.google.com/drive/folders/0B5uDfUQ1JTgldzVLaDBERG9zQmc?usp=sharing).


### Run
```julia
using HED
m = prepare()
getedge(m, "examples/dr/dr_001.png", "dr_output.png")
```

<img src="examples/dr_output.png" />
