import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_donation_app/Utils/utils.dart';
import 'package:food_donation_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_donation_app/button.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formkey= GlobalKey<FormState>();
  final emailController = TextEditingController();

  final _auth= FirebaseAuth.instance;
  void forgotPassword(){
    _auth.sendPasswordResetEmail(
        email: emailController.text,
        ).then((value) {

      utils().toastMessage('Please check your email to recover Password');
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=> const LoginScreen()));
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
                    const Text('To Recover', style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Rubik Regular',
                        color: Colors.black
                    ),),
                    const Text('Password!', style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Rubik Regular',
                      color: Color(0xff6943ba),
                    ),),
                    const SizedBox(height: 10,),
                    const Text('Enter your email', style: TextStyle(
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

                    const SizedBox(height: 30,),
                    InkWell(
                      onTap: ()async{
                        if(_formkey.currentState!.validate()){
                          forgotPassword();

                        }
                        SharedPreferences sp= await SharedPreferences.getInstance();
                        sp.setString('email', emailController.text.toString());
                        sp.setBool('isLogin', true);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => const LoginScreen()));

                      },
                      child: Button(title: 'Recover',),
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
