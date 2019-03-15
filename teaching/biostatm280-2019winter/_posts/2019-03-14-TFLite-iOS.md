---
layout: post_teaching
title: TensorFlow Lite on iOS
category: biostatm280winter2019
---

This post documents my experience reproducing the results in blog <https://heartbeat.fritz.ai/neural-networks-on-mobile-devices-with-tensorflow-lite-a-tutorial-85b41f53230c>. The tutorial is about developing an iOS app for image classification using TensorFlow Lite. 

My machine is MacBook Pro running macOS Mojave v10.14.3 and Xcode 10.1. 

I can follow most steps in the blog except following few tweaks:

1. When calling the toco program, we need to supply the `input_file` and `input_format` arguments. So the correct command is
```
toco \
--graph_def_file=tf_files/retrained_graph.pb \
--output_file=tf_files/optimized_graph.lite \
--output_format=TFLITE \
--input_shape=1,${IMAGE_SIZE},${IMAGE_SIZE},3 \
--input_array=input \
--output_array=final_result \
--inference_type=FLOAT \
--inference_input_type=FLOAT \
--input_file=tf_files/retrained_graph.pb \
--input_format=TENSORFLOW_GRAPHDEF
```

2. When open the Xcode project, the project name should be `tflite_photos_example`. So the correct command is:
```
open ios/tflite/tflite_photos_example.xcworkspace
```

3. When test the default project with Xcode, it will have errors finding certain TensorFlow header files. This is due to recent directory change in TensorFlow project. Just update the corresponding lines in the `CameraExampleViewController.h` and `CameraExampleViewController.mm` files:
    - Change
    ```
    #include "tensorflow/contrib/lite/kernels/register.h"
    ```
    to
    ```
    #include "tensorflow/lite/kernels/register.h"
    ```
    - Change
    ```
    #include "tensorflow/contrib/lite/model.h"
    ```
    to
    ```
    #include "tensorflow/lite/model.h"
    ```
    - etc

After these tweaks, the app runs smoothly in the Xcode simulator. So Scafos is not necessary for running TensorFlow Lite. For purpose of this homework, it suffices for the app to run in Xcode simulator, which does not require Apple Developer ID.