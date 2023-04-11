import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skealth/constants.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        centerTitle: true,
        title: Text(
          "DISEASE INFO",
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
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.04.sw,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buildDiseaseInfo(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildDiseaseInfo() {
    List<Widget> infoWidgets = <Widget>[];
    diseaseInfo.forEach((disease) {
      infoWidgets.add(
        infoWidget(disease),
      );
    });
    return infoWidgets;
  }
}

Widget infoWidget(DiseaseInfo diseaseInfo) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 0.03.sw),
    child: Container(
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(
          color: secondaryColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            5.r,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(0.01.sw),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 0.2.sw,
              child: Image.asset(diseaseInfo.image),
            ),
            Container(
              width: 0.65.sw,
              child: ExpansionTile(
                children: buildSymptoms(diseaseInfo.symptoms),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Text(
                  diseaseInfo.name,
                  style: TextStyle(
                    fontSize: 15.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  diseaseInfo.description,
                  style: TextStyle(
                    fontSize: 12.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

List<Widget> buildSymptoms(List<String> symptoms) {
  List<Widget> symptomList = [
    Text(
      "Common Symptoms",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  ];
  symptoms.forEach((symptom) {
    symptomList.add(Text("\u2022 " + symptom));
  });
  return symptomList;
}
