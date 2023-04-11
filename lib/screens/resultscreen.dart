import 'package:breathing_collection/breathing_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skealth/constants.dart';
import 'package:skealth/screens/doctor_details.dart';

import 'dart:io';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ResultScreen extends StatelessWidget {
  final Prediction _result;

  final File image;

  ResultScreen(
    this._result,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BreathingGlowingButton(
        height: 60.r,
        width: 60.r,
        buttonBackgroundColor: primaryColor,
        glowColor: secondaryColor,
        icon: Icons.monitor_heart_outlined,
        iconColor: textColor,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DoctorDetails();
          }));
        },
      ),
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        centerTitle: true,
        title: Text(
          "R E S U L T",
          style: TextStyle(
            fontSize: 25.r,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.05.sw,
            ),
            Center(
              child: Container(
                height: 0.4.sh,
                width: 0.8.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(image.path)),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.r),
                  ),
                  border: Border.all(
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.05.sw,
            ),
            Container(
              padding: EdgeInsets.all(0.05.sw),
              width: 0.8.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    24.r,
                  ),
                ),
                gradient: LinearGradient(
                  colors: [primaryColor, secondaryColor.withOpacity(0.01)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: textColor,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      _result.name,
                      style: TextStyle(
                        fontSize: 25.r,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.05.sw,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
                    child: Text(
                      diseaseInfo[_result.index].description,
                      style: TextStyle(
                        fontSize: 12.r,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.05.sw,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.05.sw,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      customColors: CustomSliderColors(
                        trackColor: secondaryColor,
                        progressBarColors: [
                          Color(0xFF03045E),
                          Color(0xFF023E8A),
                          Color(0xFF0077B6),
                          Color(0xFF0096C7),
                          Color(0xFF00B4D8),
                        ],
                      ),
                      customWidths: CustomSliderWidths(
                        progressBarWidth: 20.r,
                      ),
                      infoProperties: InfoProperties(
                        topLabelText: "Accuracy",
                        topLabelStyle: TextStyle(fontSize: 17.r),
                        mainLabelStyle: TextStyle(color: primaryColor),
                      ),
                    ),
                    min: 0,
                    max: 100,
                    initialValue: double.parse(
                      _result.confidence
                          .substring(0, _result.confidence.length - 1),
                    ),
                  ),
                  SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      customColors: CustomSliderColors(
                        trackColor: secondaryColor,
                        progressBarColors: <Color>[
                          Color(0xFFA4133C),
                          Color(0xFFD90429),
                          Color(0xFFFF8FA3),
                        ],
                      ),
                      customWidths: CustomSliderWidths(
                        progressBarWidth: 20.r,
                      ),
                      infoProperties: InfoProperties(
                        topLabelText: "Severity",
                        topLabelStyle: TextStyle(fontSize: 17.r),
                        mainLabelStyle: TextStyle(color: primaryColor),
                      ),
                    ),
                    min: 0,
                    max: 4,
                    initialValue: diseaseInfo[_result.index].severity,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.15.sw,
            ),
          ],
        ),
      ),
    );
  }
}
