# CAE-ELM 
## Introduction
3D shape features play a crucial role in graphics applications, such as 3D shape matching, recognition, and retrieval. Various 3D shape descriptors have been developed over the last two decades; however, existing descriptors are handcrafted features that are labor-intensively designed and cannot extract discriminative information for a large set of data. 

We propose a rapid 3D feature learning method, namely, a convolutional auto-encoder extreme learning machine (CAE-ELM) that combines the advantages of the convolutional neuron network, auto-encoder, and extreme learning machine (ELM). This method performs better and faster than other methods. 

In addition, we define a novel architecture based on CAE-ELM. The architecture accepts two types of 3D shape representation, namely, voxel data and signed distance field data (SDF), as inputs to extract the global and local features of 3D shapes. Voxel data describe structural information, whereas SDF data contain details on 3D shapes.

Moreover, the proposed CAE-ELM can be used in practical graphics applications, such as 3D shape completion. Experiments show that the features extracted by CAE-ELM are superior to existing hand-crafted features and other deep learning methods or ELM models.

## Results

The classification accuracy of the proposed architecture is superior to that of other methods on ModelNet10 (91.4%) and ModelNet40 (84.35%). The training process also runs faster than existing deep learning methods by approximately two orders of magnitude.

## run
Convert your 3D shape into 2 types: voxel and sdf data.  
If you only have *.off files or dirs, you can copy ./readdata/getsdfdata/* and ./readdata/getvoxeldata/* to your off dirs, then run the "runexe.m" to generate voxel data and sdf data.
After that, you can copy the sdfdata.mat and voxeldata.mat to ./data, and add the path in "run_fea_combine.m". Then run "run_fea_combine.m". 

