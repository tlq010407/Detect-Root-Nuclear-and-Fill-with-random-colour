# Image Processing Coursework

## Overview
This repository contains the MATLAB code and report for an image processing coursework project. The project focuses on image segmentation, noise reduction, and color space conversion to enhance and analyze nuclear images.

## Features
- **Color Space Conversion:** Utilizes the YCbCr color space for enhanced image processing.
- **Binary Image Processing:** Converts images to binary for easier segmentation.
- **Histogram Equalization:** Enhances image contrast for better segmentation.
- **Edge Smoothing:** Uses the SLIC superpixel algorithm to smooth nuclear edges.
- **Noise Reduction:** Implements Wiener and Gaussian filters for image denoising.
- **Random Color Fill:** Applies color labeling for segmented components.

## Implementation Details
1. **Color Space Conversion**
   - The images are converted from RGB to YCbCr.
   - The Cr channel is extracted for further processing.

2. **Binary Image Generation**
   - A threshold is applied to obtain a binary image.
   - Noise removal techniques are applied to refine segmentation.

3. **Histogram Equalization**
   - Enhances the grayscale intensity of the nuclear region.
   - Adaptive thresholding is used to separate foreground and background.

4. **Edge Smoothing**
   - The SLIC superpixel algorithm is applied to smooth edges while maintaining segmentation accuracy.

5. **Noise Reduction**
   - **Wiener Filter:** Applied with different neighborhood sizes (3x3, 4x4, 5x5) to minimize noise while preserving details.
   - **Gaussian Filter:** Applied with sigma values (0.5, 1.0) for additional noise smoothing.

6. **Random Color Fill**
   - Segmented nuclear regions are labeled and assigned random colors using MATLAB functions.

## Requirements
- MATLAB (with Image Processing Toolbox)
- Required MATLAB functions:
  - `Color Threshold`
  - `graythresh`
  - `imbinarize`
  - `superpixels`
  - `wiener2`
  - `imgaussfilt`
  - `bwconncomp`
  - `label2rgb`

## How to Run
1. Open MATLAB and navigate to the project folder.
2. Run the provided script to process the images.
3. Adjust parameters if necessary for optimal results.

## Strengths and Weaknesses
### Strengths:
- Automated processing without manual intervention.
- Balanced performance across different images.
- Effective noise reduction while preserving nuclear structure.

### Weaknesses:
- Some loss of nuclear detail due to edge smoothing.
- Noise filtering may reduce some important structures.
- Difficult to fully extract nuclear components without affecting edge definition.

## Conclusion
This project demonstrates the challenges and trade-offs in image processing. The combination of histogram equalization, superpixel smoothing, and noise filtering produces optimal results for nuclear segmentation. Future improvements could focus on better edge preservation and adaptive filtering techniques.

## References
1. MATLAB Documentation on [Color Spaces](https://www.mathworks.com/help/images/understanding-color-spaces-and-color-space-conversion.html)
2. Dias, D. (2017). "What is YCbCr?" [Medium](https://medium.com/breaktheloop/what-is-ycbcr-964fde85eeb3)
3. MATLAB Documentation on [Image Filtering](https://www.mathworks.com/help/images/linear-filtering.html)
4. MATLAB Documentation on [Wiener Filter](https://www.mathworks.com/help/images/ref/wiener2.html)

