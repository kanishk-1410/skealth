import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skealth/constants.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        centerTitle: true,
        title: Text(
          "C O N S U L T",
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
            Padding(
              padding: EdgeInsets.all(0.05.sw),
              child: Text(
                'Skin specialist near you!',
                style: TextStyle(
                  fontSize: 18.r,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Column(
              children: _buildDoctorInfo(),
            ),
            SizedBox(
              height: 0.05.sw,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDoctorInfo() {
    List<Widget> doctorWidgets = <Widget>[];
    doctors.forEach((doctor) {
      doctorWidgets.add(Padding(
        padding: EdgeInsets.all(0.05.sw),
        child: ExpansionTile(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80.r,
                  height: 80.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(doctor.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.1.sw,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.call),
                        SizedBox(
                          height: 20.h,
                        ),
                        Icon(Icons.home),
                        SizedBox(
                          height: 20.h,
                        ),
                        Icon(Icons.access_time_rounded),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(doctor.contact),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(doctor.location),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(doctor.hours),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 0.1.sw,
            ),
          ],
          subtitle: Text(
            doctor.qualification,
            style: TextStyle(
              fontSize: 15.r,
              fontFamily: 'Montserrat',
            ),
          ),
          title: Text(
            doctor.name,
            style: TextStyle(
              fontSize: 20.r,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ));
    });
    return doctorWidgets;
  }
}
