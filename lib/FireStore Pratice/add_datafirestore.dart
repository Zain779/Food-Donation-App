import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/FireStore%20Pratice/firestore_screen.dart';
import 'package:food_donation_app/Utils/utils.dart';
import 'package:food_donation_app/button.dart';
// import 'search_food.dart';

class AddDataFireStore extends StatefulWidget {
  const AddDataFireStore({Key? key}) : super(key: key);

  @override
  State<AddDataFireStore> createState() => _AddDataFireStoreState();
}

class _AddDataFireStoreState extends State<AddDataFireStore> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final zipController = TextEditingController();
  final foodTypeController = TextEditingController();
  final quantityController = TextEditingController();
  final fireStore= FirebaseFirestore.instance.collection('type');
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
                  border: Border.all(
                      color: Colors.amber,
                      width: 3
                    // strokeAlign: StrokeAlign.inside,
                  ),
                  borderRadius: BorderRadius.circular(8),

                ),


                child: Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Center(
                            child: Text(' Share Food',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: 'Rubik Regular',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller : nameController,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(Icons.person_pin,color: Color(0xff323F4B),),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(Icons.mail_outline_outlined,color: Color(0xff323F4B),),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(Icons.phone,color: Color(0xff323F4B),),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: addressController,
                            decoration: InputDecoration(
                              hintText: 'Address',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(Icons.my_location,color: Color(0xff323F4B),),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: zipController,
                            decoration: InputDecoration(
                              hintText: 'Zip',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(Icons.location_on,color: Color(0xff323F4B),),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: foodTypeController,
                            decoration: InputDecoration(
                              hintText: 'Food Type',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(Icons.food_bank_outlined,color: Color(0xff323F4B),),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: quantityController,
                            decoration: InputDecoration(
                              hintText: 'Quantity',
                              fillColor: const Color(0xffF8F9FA),
                              filled: true,
                              prefixIcon: const Icon(Icons.numbers_sharp,color: Color(0xff323F4B),),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: ()async{
                              String id=DateTime.now().millisecondsSinceEpoch.toString();
                              fireStore.doc(id).set({
                                'id': id,
                                'Name': nameController.text.toString(),
                                'email': emailController.text.toString(),
                                'Phone Number': phoneNumberController.text.toString(),
                                'Address': addressController.text.toString(),
                                'Zip': zipController.text.toString(),
                                'Food Type': foodTypeController.text.toString(),
                                'Quantity': quantityController.text.toString()



                              }).then((value) {
                                utils().toastMessage('Successfully added');
                              }).onError((error, stackTrace) {
                                utils().toastMessage(error.toString());
                              });
                              // SharedPreferences sp = await SharedPreferences.getInstance();
                              // sp.setString('Name', nameController.text.toString());
                              // sp.setString('email', emailController.text.toString());
                              // sp.setString('Phone Number', phoneNumberController.text.toString());
                              // sp.setString('Address', addressController.text.toString());
                              // sp.setString('Zip', zipController.text.toString());
                              // sp.setString('Food Type', foodTypeController.text.toString());
                              // sp.setString('Quantity', quantityController.text.toString());
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>const FireStoreScreen()));
                            },
                            child:
                            Button(title: 'Post Data'),
                          ),


                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}
