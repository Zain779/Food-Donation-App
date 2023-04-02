import 'package:flutter/material.dart';
import 'package:food_donation_app/Profile/profile.dart';
import 'package:food_donation_app/Screens/donor_shared_food_screen.dart';
import 'package:food_donation_app/Utils/utils.dart';
import 'package:food_donation_app/button.dart';
import 'package:food_donation_app/select_role/select_role.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../share_food.dart';

class DonorHomeScreen extends StatefulWidget {
  bool? isDonor;
  DonorHomeScreen(this.isDonor);
  // const DonorHomeScreen({Key? key}) : super(key: key);

  @override
  State<DonorHomeScreen> createState() => _DonorHomeScreenState();
}

class _DonorHomeScreenState extends State<DonorHomeScreen> {
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
            IconButton(
                onPressed: () {
                  auth.signOut().then((value) async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SelectRole()));
                  }).onError((error, stackTrace) {
                    utils().toastMessage(error.toString());
                  });
                },
                icon: const Icon(Icons.logout)),
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('Shared Food'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DonorSharedFoodScreen()));
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Container(
                  width: 190,
                  height: 190,
                  child: const Image(image: AssetImage('assets/001.png')),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Center(
                  child: Text(
                    ' If you have extra food share it  with \n       other who are in need of it.',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Rubik Regular',
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShareFood()));
                  },
                  child: const Button(title: 'SHARE MY FOOD'),
                ),
                const SizedBox(
                  height: 30,
                ),
              ]),
            ),
          ),
        ));
  }
}
