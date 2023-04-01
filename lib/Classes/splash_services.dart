import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Donar/donor_home_screen.dart';
import 'package:food_donation_app/Receiver/receiver_home_screen.dart';
import 'package:food_donation_app/Services/session_manager.dart';
import 'package:food_donation_app/login_screen.dart';
import 'package:food_donation_app/select_role/select_role.dart';
import 'package:food_donation_app/selection_screen.dart';
import 'dart:async';

class SplashServices{
  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;




    bool? isDonor;
    bool? isReceiver;

    // Timer(const Duration(seconds: 5 ), ()
    // =>Navigator.push(context, MaterialPageRoute(builder: (context)=>const SelectRole()))
    // );
    if (user != null){
      SessionController().userID= user.uid.toString();
      Timer(const Duration(seconds: 5 ), ()
      =>Navigator.push(context, MaterialPageRoute(builder: (context)=> DonorHomeScreen(isDonor)))
      );
    }
     if (user != null){
      SessionController().userID!= user.uid.toString();
      Timer(const Duration(seconds: 5 ), ()
      =>Navigator.push(context, MaterialPageRoute(builder: (context)=> ReceiverHomeScreen(isReceiver)))
      );
    }
    else{
      Timer(const Duration(seconds: 5 ), ()
      =>Navigator.push(context, MaterialPageRoute(builder: (context)=>const SelectRole()))
      );
    }




    // if (user != null){
    //   SessionController().userID= user.uid.toString();
    //   Timer(const Duration(seconds: 5 ), ()
    //   =>Navigator.push(context, MaterialPageRoute(builder: (context)=>const SelectionScreen()))
    //   );
    // }
    // else{
    //   Timer(const Duration(seconds: 5 ), ()
    //   =>Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()))
    //   );
    // }

  }
}