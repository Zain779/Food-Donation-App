import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Donar/donor_home_screen.dart';
import 'package:food_donation_app/Utils/utils.dart';
import 'button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';

class ShareFood extends StatefulWidget {
  const ShareFood({Key? key}) : super(key: key);

  @override
  State<ShareFood> createState() => _ShareFoodState();
}

class _ShareFoodState extends State<ShareFood> {
  final auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final zipController = TextEditingController();
  final foodTypeController = TextEditingController();
  final quantityController = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref('Data');

  @override
  void initState() {
    emailController.text = auth.currentUser?.email ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Container(
                // height: 800,
                // width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Center(
                            child: Text(
                              ' Share Food',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: 'Rubik Regular',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff6943ba)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.person_pin,
                                color: Color(0xff323F4B),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.mail_outline_outlined,
                                color: Color(0xff323F4B),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Color(0xff323F4B),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: addressController,
                            decoration: InputDecoration(
                              hintText: 'Address',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.my_location,
                                color: Color(0xff323F4B),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: zipController,
                            decoration: InputDecoration(
                              hintText: 'Zip',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.location_on,
                                color: Color(0xff323F4B),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: foodTypeController,
                            decoration: InputDecoration(
                              hintText: 'Food Type',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.food_bank_outlined,
                                color: Color(0xff323F4B),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: quantityController,
                            decoration: InputDecoration(
                              hintText: 'Quantity',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.numbers_sharp,
                                color: Color(0xff323F4B),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              DocumentReference newDoc = FirebaseFirestore
                                  .instance
                                  .collection('food')
                                  .doc();
                              newDoc.set({
                                'id': newDoc.id,
                                'name': nameController.text.toString(),
                                'email': emailController.text.toString(),
                                'phone_number':
                                    phoneNumberController.text.toString(),
                                'address': addressController.text.toString(),
                                'zip': zipController.text.toString(),
                                'food_type': foodTypeController.text.toString(),
                                'quantity': quantityController.text.toString(),
                                'giverId':
                                    FirebaseAuth.instance.currentUser?.uid,
                                'status': 'shared',
                                'createdAt': FieldValue.serverTimestamp(),
                                'updatedAt': FieldValue.serverTimestamp()
                              }).then((value) {
                                utils().toastMessage('Shared Successfully');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DonorHomeScreen(true)));
                              }).onError((error, stackTrace) {
                                utils().toastMessage(error.toString());
                              });

                              // databaseRef.child(id).set({
                              //   'id': id,
                              //   'Name': nameController.text.toString(),
                              //   'email': emailController.text.toString(),
                              //   'Phone Number':
                              //       phoneNumberController.text.toString(),
                              //   'Address': addressController.text.toString(),
                              //   'Zip': zipController.text.toString(),
                              //   'Food Type': foodTypeController.text.toString(),
                              //   'Quantity': quantityController.text.toString(),
                              //   'giverId':
                              //       FirebaseAuth.instance.currentUser?.uid,
                              //   'status': 'shared',

                              // SharedPreferences sp = await SharedPreferences.getInstance();
                              // sp.setString('Name', nameController.text.toString());
                              // sp.setString('email', emailController.text.toString());
                              // sp.setString('Phone Number', phoneNumberController.text.toString());
                              // sp.setString('Address', addressController.text.toString());
                              // sp.setString('Zip', zipController.text.toString());
                              // sp.setString('Food Type', foodTypeController.text.toString());
                              // sp.setString('Quantity', quantityController.text.toString());
                              // ignore: use_build_context_synchronously
                            },
                            child: const Button(title: 'Share With Other'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
