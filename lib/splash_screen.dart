
import 'package:flutter/material.dart';
import 'package:food_donation_app/Classes/splash_services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen= SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Image(
            height: double.infinity,
            fit: BoxFit.fitHeight,
            image: 
            AssetImage('assets/002.png')
        ),
    );
  }
}
