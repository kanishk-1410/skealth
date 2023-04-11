import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skealth/screens/homepage.dart';
import 'package:skealth/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bgi.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(0.05.sw),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.camera_enhance_rounded),
                Text(
                  "Scan",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Icon(Icons.chevron_right_rounded),
                Icon(Icons.analytics),
                Text(
                  "Predict",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Icon(Icons.chevron_right_rounded),
                Icon(Icons.monitor_heart_outlined),
                Text(
                  "Consult",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15.r,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 0.05.sw),
          TextButton(
            child: Text(
              "Start Now",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20.r,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
              ),
            ),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                Size.fromWidth(0.8.sw),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              backgroundColor: MaterialStatePropertyAll(textColor),
              overlayColor: MaterialStatePropertyAll(secondaryColor),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 0.05.sw,
          ),
        ],
      ),
    );
  }
}
