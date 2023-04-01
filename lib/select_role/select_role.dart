import 'package:flutter/material.dart';
import 'package:food_donation_app/ReceiverLog&SignUp/login_screen_receiver.dart';
import 'package:food_donation_app/ReceiverLog&SignUp/signup_screen_receiver.dart';
import 'package:food_donation_app/button.dart';
import 'package:food_donation_app/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../signup_screen.dart';



class SelectRole extends StatefulWidget {
  const SelectRole({Key? key}) : super(key: key);

  @override
  State<SelectRole> createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff7f7f7),
        appBar: AppBar(
          // automaticallyImplyLeading: false,

          title: const Text('Welcome'),
          centerTitle: true,
          backgroundColor: const Color(0xff6943ba),

        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  children: [
                    Container(
                      width: 190,
                      height: 190,
                      child: const Image(image: AssetImage('assets/001.png')),

                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    const Center(
                      child: Text(' If you have extra food share it  with \n       other who are in need of it.',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Rubik Regular',
                            color: Colors.black
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> const LoginScreen()));
                      },
                      child: Button(title: 'LogIn as Donar'),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Rubik Regular',
                              color: Colors.black
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const SignUpScreen()));
                          },

                          child: const Text(' Sign Up',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Rubik Regular',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6943ba)
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(' --or--',
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'Rubik Regular',
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text('Search for Food',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Rubik Regular',
                            color: Colors.black
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>const LoginScreenReceiver()));
                      },
                      child: Button(title: 'LogIn to get Food'),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Rubik Regular',
                              color: Colors.black
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const SignUpScreenReceiver()));
                          },

                          child: const Text(' Sign Up',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Rubik Regular',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff6943ba)
                            ),
                          ),
                        )
                      ],
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // InkWell(
                    //   onTap: (){
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context)=>const AddDataFireStore()));
                    //   },
                    //   child: Button(title: 'FireStore Practice'),
                    // ),



                  ]
              ),
            ),
          ),
        )

    );
  }
}
