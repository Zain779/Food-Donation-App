import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_donation_app/Forgot%20Password/forgot_password.dart';
import 'package:food_donation_app/Receiver/receiver_home_screen.dart';
import 'package:food_donation_app/ReceiverLog&SignUp/signup_screen_receiver.dart';
import 'package:food_donation_app/Utils/utils.dart';
import 'package:food_donation_app/selection_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_donation_app/button.dart';
import 'package:food_donation_app/Services/session_manager.dart';


class LoginScreenReceiver extends StatefulWidget {
  const LoginScreenReceiver({Key? key}) : super(key: key);

  @override
  State<LoginScreenReceiver> createState() => _LoginScreenReceiverState();
}

class _LoginScreenReceiverState extends State<LoginScreenReceiver> {
  final _formkey= GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth= FirebaseAuth.instance;
  void receiverlogin(){
    _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text.toString()).then((value) {
      SessionController().userID= value.user!.uid.toString();
      utils().toastMessage(value.user!.email.toString());
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context)=> const SelectionScreen()));
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      utils().toastMessage(error.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formkey,
                child: Column(

                  children: [

                    const SizedBox(height: 10,),
                    const Text('Welcome', style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Rubik Regular',
                        color: Colors.black
                    ),),
                    const Text('Back!', style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Rubik Regular',
                      color: Color(0xff6943ba),
                    ),),
                    const SizedBox(height: 10,),
                    const Text('Sign In to your account', style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Rubik Regular',
                        color: Colors.black
                    ),),
                    const SizedBox(height: 20,),

                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: const Color(0xffF8F9FA),
                        filled: true,
                        prefixIcon: const Icon(Icons.alternate_email,color: Color(0xff323F4B),),
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
                    const SizedBox(height: 10,),
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
                    const SizedBox(height: 5,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ForgotPasswordScreen() ));
                      },
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password?', style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Rubik Regular',
                            color: Colors.black,
                            decoration: TextDecoration.underline
                        ),),
                      ),
                    ),

                    const SizedBox(height: 30,),
                    InkWell(
                      onTap: ()async{
                        if(_formkey.currentState!.validate()){
                          receiverlogin();

                        }
                        SharedPreferences sp= await SharedPreferences.getInstance();
                        sp.setString('email', emailController.text.toString());
                        sp.setBool('isLogin', true);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ReceiverHomeScreen(true)));

                      },
                      child: Button(title: 'LogIn',),
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

                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
