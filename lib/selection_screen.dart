import 'package:flutter/material.dart';
import 'package:food_donation_app/Profile/profile.dart';
import 'package:food_donation_app/Utils/utils.dart';
import 'package:food_donation_app/button.dart';
import 'package:food_donation_app/practice.dart';
import 'package:food_donation_app/select_role/select_role.dart';
import 'share_food.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
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
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const SelectRole()));
            }).onError((error, stackTrace) {
              utils().toastMessage(error.toString());
            });
          }, icon: const Icon(Icons.logout)),

        ],
      ),
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff6943ba),
                ),
                  accountName: Text('Zain'),
                  accountEmail: Text('admin@gmail.com')),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()));
                },
              ),

            ],
          ),
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
                          height: 25,
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
                                MaterialPageRoute(builder: (context)=>const ShareFood()));
                          },
                          child: Button(title: 'SHARE MY FOOD'),
                        ),
                        const SizedBox(
                          height: 30,
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
                          height: 30,
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
                                MaterialPageRoute(builder: (context)=>const Practice()));
                          },
                          child: Button(title: 'SEARCH FOR FOOD'),
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
