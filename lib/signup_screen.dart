import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Donar/donor_home_screen.dart';
import 'package:food_donation_app/Receiver/receiver_home_screen.dart';
import 'package:food_donation_app/Utils/utils.dart';
import 'package:food_donation_app/button.dart';
import 'package:food_donation_app/login_screen.dart';
import 'package:food_donation_app/resources/color.dart';
import 'selection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var userType = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference _users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        // child: Container(
        //   height: 500,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     border: Border.all(
        //       color: Colors.amber,
        //       width: 3
        //       // strokeAlign: StrokeAlign.inside,
        //     ),
        //     borderRadius: BorderRadius.circular(8),
        //
        //   ),

        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      ' Create Your Account',
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Rubik Regular',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6943ba)),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            userType = 'donate';
                          });
                        },
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: userType == 'donate'
                                        ? AppColors.appColor
                                        : Colors.black,
                                    width: 2),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text('Donate'),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            userType = 'taker';
                          });
                        },
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: userType == 'taker'
                                        ? AppColors.appColor
                                        : Colors.black,
                                    width: 2),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text('Taker'),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      fillColor: const Color(0xffF8F9FA),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Color(0xff323F4B),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      fillColor: const Color(0xffF8F9FA),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Color(0xff323F4B),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: const Color(0xffF8F9FA),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.lock_open,
                        color: Color(0xff323F4B),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      fillColor: const Color(0xffF8F9FA),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xff323F4B),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Confirm Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        if (userType.isNotEmpty) {
                          _auth
                              .createUserWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString())
                              .then((value) {
                            _users.doc(value.user!.uid.toString()).set({
                              'id': value.user!.uid,
                              'email': value.user!.email,
                              'type': userType,
                              'phone': '',
                              'OnlineStatus': 'NoOne',
                              'profile': '',
                              'User Name' : userNameController.text.toString(),
                            });

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    userType == 'taker'
                                        ? ReceiverHomeScreen(true)
                                        : DonorHomeScreen(true)));
                          }).onError((error, stackTrace) {
                            utils().toastMessage(error.toString());
                          });
                        } else {
                          utils().toastMessage(
                              'Please select user type ( donate or taker )');
                        }
                      }
                    },

                    // onTap: () async {
                    //   if (_formKey.currentState!.validate()) {
                    //     if (userType.isNotEmpty) {
                    //       _auth
                    //           .createUserWithEmailAndPassword(
                    //               email: emailController.text.toString(),
                    //               password: passwordController.text.toString())
                    //           .then((UserCredential userCredential) {
                    //         User? user = userCredential.user;
                    //         assert(user?.uid != null);
                    //         try {
                    //           _users.add({
                    //             'id': user?.uid,
                    //             'email': user?.email,
                    //             'type': userType,
                    //             'phone': '',
                    //             'OnlineStatus': 'NoOne',
                    //             'profile': '',
                    //             'User Name' : userNameController.text.toString(),
                    //
                    //           });
                    //         } catch (e) {
                    //           if (kDebugMode) {
                    //             print(e.toString());
                    //           }
                    //         }
                    //
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (context) => userType == 'taker'
                    //                     ? ReceiverHomeScreen(true)
                    //                     : DonorHomeScreen(true)));
                    //       }).onError((error, stackTrace) {
                    //         utils().toastMessage(error.toString());
                    //       });
                    //     } else {
                    //       utils().toastMessage(
                    //           'Please select user type ( donate or taker )');
                    //     }
                    //   }
                    // },
                    child: const Button(title: 'SignUp'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Rubik Regular',
                            color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          ' LogIn',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Rubik Regular',
                              fontWeight: FontWeight.bold,
                              color: Color(0xff6943ba)),
                        ),
                      )
                    ],
                  ),
                ]),
          ),
        ),
      ),
      // )
    ));
  }
}
