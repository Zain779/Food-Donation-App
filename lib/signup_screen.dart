import 'package:flutter/material.dart';
import 'package:food_donation_app/Donar/donor_home_screen.dart';
import 'package:food_donation_app/Utils/utils.dart';
import 'package:food_donation_app/button.dart';
import 'package:food_donation_app/login_screen.dart';
import 'selection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey= GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
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


        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),

          child:Form(
              key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(' Create Your Account',
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Rubik Regular',
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6943ba)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    fillColor: const Color(0xffF8F9FA),
                    filled: true,
                    prefixIcon: const Icon(Icons.email_outlined,color: Color(0xff323F4B),),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                  validator: (value){
                    if (value!.isEmpty){
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
                    prefixIcon: const Icon(Icons.lock_open,color: Color(0xff323F4B),),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                  validator: (value){
                    if (value!.isEmpty){
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
                    prefixIcon: const Icon(Icons.lock,color: Color(0xff323F4B),),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                  validator: (value){
                    if (value!.isEmpty){
                      return 'Enter Confirm Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: ()async{
                    if(_formKey.currentState!.validate()){
                      _auth.createUserWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString()).then((value) {

                      }).onError((error, stackTrace) {
                        utils().toastMessage(error.toString());
                      });

                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>  DonorHomeScreen(true)));
                  },
                  child: Button(title: 'SignUp'),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Rubik Regular',
                          color: Colors.black
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  const LoginScreen()));
                      },

                      child: const Text(' LogIn',
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

              ]
          ),)

        ),
      ),
    // )
        )
    );
  }
}
