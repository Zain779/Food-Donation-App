import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Donar/donor_home_screen.dart';
import 'package:food_donation_app/Utils/utils.dart';
import 'button.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/material/dropdown.dart';

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


  List<String> items= <String>['Vegetable','Meat','Cocked Meal','Fruit','Other'];
  String food_type='Vegetable';
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
                          // TextFormField(
                          //   controller: foodTypeController,
                          //   decoration: InputDecoration(
                          //     hintText: 'Food Type',
                          //     fillColor: const Color(0xffF8F9FA),
                          //     filled: true,
                          //     prefixIcon: const Icon(
                          //       Icons.food_bank_outlined,
                          //       color: Color(0xff323F4B),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide:
                          //           const BorderSide(color: Color(0xffE4E7EB)),
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderSide:
                          //           const BorderSide(color: Color(0xffE4E7EB)),
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          DropdownButtonFormField<String>(

                            value: food_type,
                              onChanged: (String?newValue){
                              setState(() {
                                food_type= newValue!;
                              });
                              },
                              items: items.map<DropdownMenuItem<String>>(
                                (String value){
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }
                              ).toList(),
                            decoration: InputDecoration(
                              hintText: 'Food Type',
                              fillColor:
                              // Color(0xffF8F9FA),
                              Colors.deepPurple.shade100,
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
                                // 'food_type': foodTypeController.text.toString(),
                                'food_type':food_type,
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
