import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:skealth/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skealth/screens/infoscreen.dart';
import 'package:skealth/screens/resultscreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File pickedImage;
  bool isImageLoaded = false;

  String _confidence = "";
  int _diseaseIndex;
  String _diseaseName = "";

  Future<void> selectFromImagePicker({bool pickFromCamera}) async {
    ImagePicker _picker = ImagePicker();
    XFile image;
    if (pickFromCamera) {
      image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery);
    }
    if (image == null) return;
    setState(() {
      pickedImage = File(image.path);
      isImageLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  void loadModel() async {
    Tflite.close();
    String res = await Tflite.loadModel(
      model: "assets/model/generated.tflite",
      labels: "assets/model/labels.txt",
    );
    if (res != "success") {
      print("Error Loading Model!");
    }
  }

  void predictImage() async {
    if (pickedImage == null) return;
    List predictions = await Tflite.runModelOnImage(path: pickedImage.path);
    Map<String, dynamic> result =
        json.decode(json.encode(predictions[0])) as Map<String, dynamic>;

    _diseaseName = result["label"].substring(3, result["label"].length - 1);
    _diseaseIndex = int.parse(result["label"].substring(0, 1));
    _confidence = result != null
        ? (result['confidence'] * 100).toString().substring(0, 3) + "%"
        : "";

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          Prediction(
            _diseaseIndex,
            _diseaseName,
            _confidence,
          ),
          pickedImage,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        centerTitle: true,
        title: Text(
          "S K E A L T H",
          style: TextStyle(
            fontSize: 25.r,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline,
              size: 20.r,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoScreen(),
                ),
              );
            },
          ),
          SizedBox(
            width: 0.02.sw,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 0.05.sw,
          ),
          Container(
            height: 0.4.sh,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.r),
              ),
              border: Border.all(
                color: secondaryColor,
              ),
            ),
            width: 0.8.sw,
            child: isImageLoaded
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.r),
                      ),
                      border: Border.all(
                        color: textColor,
                      ),
                      image: DecorationImage(
                        image: FileImage(pickedImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 50.r,
                    ),
                    onPressed: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upload an Image",
                                style: TextStyle(
                                  fontSize: 20.r,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 0.05.sw,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: textColor,
                                        radius: 50.r,
                                        child: IconButton(
                                          onPressed: () async {
                                            await selectFromImagePicker(
                                              pickFromCamera: false,
                                            );
                                            if (isImageLoaded) {
                                              Navigator.pop(context);
                                            }
                                          },
                                          icon: Icon(Icons.image_rounded),
                                          color: secondaryColor,
                                          iconSize: 40.r,
                                          splashRadius: 60.r,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.05.sw,
                                      ),
                                      Text(
                                        "Upload from Files",
                                        style: TextStyle(
                                          fontSize: 12.r,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 0.05.sw,
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: textColor,
                                        radius: 50.r,
                                        child: IconButton(
                                          onPressed: () async {
                                            await selectFromImagePicker(
                                              pickFromCamera: true,
                                            );
                                            if (isImageLoaded) {
                                              Navigator.pop(context);
                                            }
                                          },
                                          icon: Icon(
                                            Icons.camera_enhance_rounded,
                                          ),
                                          color: secondaryColor,
                                          iconSize: 40.r,
                                          splashRadius: 60.r,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.05.sw,
                                      ),
                                      Text(
                                        "Upload from Camera",
                                        style: TextStyle(
                                          fontSize: 12.r,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
          ),
          SizedBox(
            height: 0.05.sw,
          ),
          isImageLoaded
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 0.05.sw,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isImageLoaded = false;
                          pickedImage = null;
                        });
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                        ),
                        overlayColor:
                            MaterialStatePropertyAll(secondaryColor),
                      ),
                      child: Text(
                        "Remove",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 20.r,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                )
              : Text(
                  "Upload Image",
                  style: TextStyle(
                    fontSize: 20.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                  ),
                ),
          SizedBox(
            height: 0.1.sw,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
            child: TextButton(
              onPressed: () {
                if (!isImageLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: errorColor,
                      content: Text("Please Select an Image First"),
                    ),
                  );
                  return;
                }
                predictImage();
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(0.9.sw, 0.15.sw),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(textColor),
                overlayColor: MaterialStatePropertyAll(secondaryColor),
              ),
              child: Text(
                "Predict",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20.r,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.1.sw,
          ),
        ],
      ),
    );
  }
}
