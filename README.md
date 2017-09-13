# Master-Thesis
Semantic Motion Segmentation using Optical flow and Convolutional Neural Networks

# Overview
This thesis is being currently conducted at Universität Paderborn in GETLAB (https://getwww.uni-paderborn.de/teaching/) under the supervision of Prof. Dr.-Ing. Bärbel Mertsching.

In this thesis work, motion segmentation for sequence of images captured using a moving camera is performed. For designing this motion segmentation algorithm, a classical computer vision approach in combination with a recent and well known deep learning approach is used. In order to obtain superior motion segmentations for moving camera images, the thesis work uses semantic labeling for sequence of images and optical flow orientations which are calculated using this information. Also, a CNN is used for which these optical flow orientations are used as inputs.

# Introduction
Motion segmentation can be defined as a process of separating the objects in a sequence of images that correspond to change in position or orientation in a specific ’D’ dimensional space/subspace in ’k’ successive time frames. The task of motion segmentation for sequence of images is illustrated in one of the attached figures. A popular application of motion segmentation is equipping the robots with this information, for example, rescue robots searching for human bodies stuck in debris after a disaster in which the specified robots are able to semantically differentiate objects in the scene. Another example includes robot path planning where a robot can identify obstacles using the semantic information and plan its path accordingly.

# Optical flow
Optical flow is defined as the pattern of apparent motion of objects in two or more consecutive sequence of images. Mathematically, optical flow is a 2D vector field where each vector indicates the displacement of movement of objects in sequence of images. For this thesis work, the optical flow orientations are used which provide the angular movement of objects relative to the moving camera for sequence of images. For this theis work, code from the following paper is used with a small modification. 

Scientific Paper : Sun, Deqing, Stefan Roth, and Michael J. Black. "Secrets of optical flow estimation and their principles." Computer Vision and Pattern Recognition (CVPR), 2010 IEEE Conference on. IEEE, 2010.
Download the paper here : http://128.148.32.110/people/dqsun/pubs/cvpr_2010_flow.pdf

# The challenge of images captured using moving camera 
For images captured using a moving camera, it is impossible to determine whether the object is moving or stationary without a prior knowledge of the object. E.g, If you consider a moving camera watching a homogeneous region which is actually static, it then appears to be moving due to the motion of the camera which is relative to the homogeneous region. To solve this problem, I perform semantic segmentation to get the prior knowledge of moving and stationary objects.

# Inspriration for this thesis work

Paper 1 : Reddy, N D.; Singhal, Prateek; Krishna, K M.: Semantic motion segmentation using dense CRF formulation. In: Proceedings of the 2014 Indian Conference on Computer Vision Graphics and Image Processing ACM, 2014, pp. 56

Paper 2 : Sevilla-Lara, Laura; Sun, Deqing; Jampani, Varun; Black, Michael J.: Optical flow with semantic segmentation and localized layers. In: Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition, 2016, pp. 3889–3898

Paper 3: Narayana, Manjunath; Hanson, Allen; Learned-Miller, Erik: Coherent motion segmentation in moving camera videos using optical flow orientations. In:Proceedings of the IEEE International Conference on Computer Vision, 2013, pp.1577–1584

# Thesis Methodology

1. Semantic segmentation using a pre-trained Fully-Convolutional Neural Network (FCN8). Pre-trained networks can be downloaded here : http://www.vlfeat.org/matconvnet/pretrained/
2. Separation of foreground and background of images and calculation of optical flow orientations
3. Using optical flow orientations as inputs to a pre-trained CNN for classification and retraining the last three layers of the pre-trained network for the respective additional classes (In progress)
4. Based on the knledge of labels from CNN, reconstruction of the foreground images using autoencoders and labeling of moving objects and stationary objects using color coding (In progress)
5. Comparison of motion segmented images with ground truth images (In progress)

# Dataset
The thesis work uses the Densely Annotated Video Segmentation (version 2017) benchmark dataset. The dataset can be downloaded in the following link : http://davischallenge.org/code.html

# Pre-requisites
1. Matlab 2017a or higher
2. Matconvnet deep learning library 
3. Matlab Image Processing toolbox
4. Matlab Computer Vision toolbox
5. Matlab Neural network toolbox



