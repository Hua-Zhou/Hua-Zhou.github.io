---
layout: post_teaching
title: TensorFlow Lite on Android
category: biostatm280winter2019
---

This post documents my experience reproducing the results in blog <https://heartbeat.fritz.ai/neural-networks-on-mobile-devices-with-tensorflow-lite-a-tutorial-85b41f53230c> on an Android Phone. The tutorial is about developing an Andoid app for image classification using TensorFlow Lite. 

My machine is Lenovo Ideapad Flex 5-1570 running Windows 10 Home. 

1. Install Anaconda (Python 3.7 version) from [Anaconda website](https://www.anaconda.com/distribution/#download-section) (630MB).

2. Click Start Menu -> Anaconda Prompt to open terminal.

3. In terminal, install TensorFlow by
```{bash}
pip install tensorflow
```

4. In terminal, update NumPy to v1.6:
```
pip install numpy —upgrade
```
The numpy coming with TensorFlow is v1.15, which will cause error when training.

5. Install [Git for Windows](https://git-scm.com/download/win) (if not yet).

6. Git clone the code files.
```{bash}
git clone https://github.com/googlecodelabs/tensorflow-for-poets-2
```

7. Download training images and unzip to the location designated in tutorial.

8. Train mobinenet as instructed in tutorial.
```{bash}
python scripts\retrain.py --output_graph=tf_files\retrained_graph.pb --output_labels=tf_files\retrained_labels.txt--image_dir=tf_files\flower_photos
--architecture=mobilenet_1.0_224 --summaries_dir tf_files\training_summaries\mobilenet_1.0_244
```

9. Convert to TF Lite format
```{bash}
toco --graph_def_file=tf_files\retrained_graph.pb --output_file=tf_files\optimized_graph.lite  --output_format=TFLITE --input_shape=1,224,224,3 --input_array=input --output_array=final_result
--inference_type=FLOAT --inference_input_type=FLOAT --input_format=TENSORFLOW_GRAPHDEF
```

10. Download and install Android Studio (taking a while).

11. Follow instructions in tutorial to update the `graph.lite` and `labels.txt` files in folder `android\tflite\app\src\main\assets`.

12. Follow instructions in tutorial to open the project in `\tflite` folder. Fist time building the app, there will be a few errors when building the project. Just follow the error messages to delete a few lines. Build the APK file as instructed.

12. Connect a device (BLUE ADVANCE 5.5 HD in my case). Turn on the `Developer Options` by following instructions at <https://developer.android.com/studio/debug/dev-options>. Then I was able to run the demo app on the device. 
