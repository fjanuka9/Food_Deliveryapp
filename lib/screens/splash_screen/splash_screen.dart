import 'package:flutter/material.dart';
import 'package:foodapp/screens/splash_screen/getting_started.dart';
import 'package:foodapp/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GettingStarted()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Constants.imageAsset(
                'food.png',
              ),
            ),
            Text(
              'No waiting for food',
              style: GoogleFonts.poppins(
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
