import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:food_donation_app/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Screens/donor_shared_food_screen.dart';
import '../resources/color.dart';
import '../select_role/select_role.dart';

class ReceiverHomeScreen extends StatefulWidget {
  bool? isReceiver;
  ReceiverHomeScreen(this.isReceiver);
  // const ReceiverHomeScreen({Key? key}) : super(key: key);

  @override
  State<ReceiverHomeScreen> createState() => _ReceiverHomeScreenState();
}

class _ReceiverHomeScreenState extends State<ReceiverHomeScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Data');
  final searchFilter = TextEditingController();
  final editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,

        title: const Text('Welcome'),
        centerTitle: true,
        backgroundColor: const Color(0xff6943ba),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
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
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Taken Food'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DonorSharedFoodScreen(
                              isDonor: false,
                            )));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 0,
          ),
          const Text('Available Food',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Rubik Regular',
                  fontWeight: FontWeight.bold,
                  color: Color(0xfff6943ba))),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: searchFilter,
              decoration: InputDecoration(
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('food')
                  .where('status', isEqualTo: 'shared')
                  .where('name',
                      isGreaterThanOrEqualTo:
                          searchFilter.text.trim().toLowerCase())
                  .where('name',
                      isLessThanOrEqualTo:
                          '${searchFilter.text.trim().toLowerCase()}\uf8ff')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                final snap = snapshot.data?.docs;
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : !snapshot.hasData
                        ? const Text('PLease Wait')
                        : snap!.isEmpty
                            ? const Center(
                                child: Text('No food available'),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: snap.length,
                                itemBuilder: (context, index) {
                                  return PublicFoodListTile(snap: snap[index]);
                                },
                              );
              },
            ),
          ),
          // Expanded(
          //     child: FirebaseAnimatedList(
          //         query: ref,
          //         itemBuilder: (context,snapshot,animation,index){
          //           final foodType = snapshot.child('Food Type').value.toString();
          //           if(searchFilter.text.isEmpty){
          //             return
          //               Column(
          //                 children: [
          //                   const SizedBox(height: 20,),
          //
          //                   Container(width: 380,
          //
          //                     decoration: BoxDecoration(
          //                       border: Border.all(width: 3,color: Color(0xff6943ba)),
          //                       borderRadius: BorderRadius.circular(8),
          //                     ),
          //
          //                     child: Padding(
          //                       padding: const EdgeInsets.symmetric(horizontal: 10),
          //                       child: Row(
          //                         children: [
          //                           Column(
          //                             children: [
          //
          //                               const SizedBox(height: 15,),
          //                               Row(children: [
          //                                 const Icon(Icons.person_pin, color: Color(0xff6943ba),),
          //                                 const SizedBox(width: 5,),
          //                                 Text(snapshot.child('Name').value.toString()),
          //                               ],
          //                               ),
          //                               Row(children: [
          //                                 const Icon(Icons.mail_outline_outlined, color: Color(0xff6943ba),),
          //                                 const SizedBox(width: 5,),
          //                                 Text(snapshot.child('email').value.toString()),
          //                               ],
          //                               ),
          //                               Row(children: [
          //                                 const Icon(Icons.phone, color: Color(0xff6943ba),),
          //                                 const SizedBox(width: 5,),
          //                                 Text(snapshot.child('Phone Number').value.toString()),
          //                               ],
          //                               ),
          //                               Row(children: [
          //                                 const Text('>Food Type :',style: TextStyle(fontWeight: FontWeight.bold),),
          //                                 const SizedBox(width: 5,),
          //                                 Text(snapshot.child('Food Type').value.toString()),
          //                               ],
          //                               ),
          //                               Row(children: [
          //                                 const Text('>Quantity :',style: TextStyle(fontWeight: FontWeight.bold),),
          //                                 const SizedBox(width: 5,),
          //                                 Text(snapshot.child('Quantity').value.toString()),
          //                               ],
          //                               ),
          //                               Row(
          //                                 children: const [
          //                                   Text('Address',
          //                                       style: TextStyle(
          //                                           fontSize: 24,
          //                                           fontFamily: 'Rubik Regular',
          //                                           fontWeight: FontWeight.bold,
          //                                           color: Color(0xff6943ba))
          //                                   ),
          //                                 ],
          //                               ),
          //                               Row(
          //                                 children: [
          //                                   Text(snapshot.child('Address').value.toString()),
          //                                 ],
          //                               ),
          //                               Row(
          //                                 children: [
          //                                   Text(snapshot.child('Zip').value.toString()),
          //                                 ],
          //                               ),
          //                             ],
          //                           ),
          //                           const SizedBox(width: 40,),
          //                           Container(
          //                             height: 50,
          //                             width: 100,
          //                             decoration: BoxDecoration(
          //                               color: Color(0xff6943ba),
          //                               borderRadius: BorderRadius.circular(10),
          //                             ),
          //                             child: InkWell(
          //                               child: const Center(
          //                                   child: Text( 'Confirm' ,
          //                                     style: TextStyle(
          //                                       fontSize: 22,
          //                                       fontWeight: FontWeight.bold,
          //                                       fontFamily: 'Rubik Regular',
          //                                       color: Colors.white,
          //                                     ),
          //                                   )
          //                               ),
          //                               onTap: (){
          //                                 utils().toastMessage('aaaaaa');
          //
          //                                 // Navigator.push( context,
          //                                 //     MaterialPageRoute(builder: (context)=> const Practice()));
          //                               },
          //                             ),
          //
          //
          //                           ),
          //                           PopupMenuButton(
          //
          //                             icon: const Icon(Icons.more_vert),
          //                             itemBuilder: (context) =>[
          //                               PopupMenuItem(
          //                                   value:1,
          //                                   child: ListTile(
          //                                     onTap: (){
          //                                       Navigator.pop(context);
          //                                       showMyDialog(foodType,snapshot.child('id').value.toString());
          //                                     },
          //                                     leading: const Icon(Icons.edit),
          //                                     title: const Text('Edit'),
          //                                   )),
          //                               PopupMenuItem(
          //                                   value:2,
          //                                   child: ListTile(
          //                                     onTap: (){
          //                                       Navigator.pop(context);
          //                                       ref.child(snapshot.child('id').value.toString()).remove();
          //                                     },
          //                                     leading: const Icon(Icons.delete),
          //                                     title: const Text('Delete'),
          //                                   ))
          //                             ],
          //                           ),
          //
          //                         ],
          //                       ),
          //                     ),
          //                   )
          //                 ],
          //               );
          //
          //             // ListTile(
          //             //   title: Text(snapshot.child('Food Type').value.toString()),
          //             // );
          //           }
          //           else if(foodType.toLowerCase().contains(searchFilter.text.toLowerCase().toLowerCase())){
          //             return
          //               Column(
          //                 children: [
          //                   const SizedBox(height: 20,),
          //
          //                   Container(width: 380,
          //
          //                     decoration: BoxDecoration(
          //                       border: Border.all(width: 3,color: Color(0xff6943ba)),
          //                       borderRadius: BorderRadius.circular(8),
          //                     ),
          //
          //                     child: Padding(
          //                       padding: const EdgeInsets.symmetric(horizontal: 10),
          //                       child: Row(
          //                         children: [
          //                           Column(
          //                             children: [
          //                               const SizedBox(height: 15,),
          //                               Row(children: [
          //                                 const Icon(Icons.person_pin, color: Color(0xff6943ba)),
          //                                 const SizedBox(width: 5,),
          //                                 Text(snapshot.child('Name').value.toString()),
          //                               ],
          //                               ),
          //                               Row(children: [
          //                                 const Icon(Icons.mail_outline_outlined, color: Color(0xff6943ba)),
          //                                 const SizedBox(width: 5,),
          //                                 Text(snapshot.child('email').value.toString()),
          //                               ],
          //                               ),
          //                               Row(children: [
          //                                 const Icon(Icons.phone, color: Color(0xff6943ba)),
          //                                 const SizedBox(width: 5,),
          //                                 Text(snapshot.child('Phone Number').value.toString()),
          //                               ],
          //                               ),
          //                               Row(children: [
          //                                 const Text('>Food Type :',style: TextStyle(fontWeight: FontWeight.bold),),
          //                                 const SizedBox(width: 5,),
          //                                 Text(snapshot.child('Food Type').value.toString()),
          //                               ],
          //                               ),
          //                               Row(children: [
          //                                 const Text('>Quantity :',style: TextStyle(fontWeight: FontWeight.bold),),
          //                                 const SizedBox(width: 5,),
          //                                 Text(snapshot.child('Quantity').value.toString()),
          //                               ],
          //                               ),
          //                               Row(
          //                                 children: const [
          //                                   Text('Address',
          //                                       style: TextStyle(
          //                                           fontSize: 24,
          //                                           fontFamily: 'Rubik Regular',
          //                                           fontWeight: FontWeight.bold,
          //                                           color: Color(0xff6943ba))
          //                                   ),
          //                                 ],
          //                               ),
          //                               Row(
          //                                 children: [
          //                                   Text(snapshot.child('Address').value.toString()),
          //                                 ],
          //                               ),
          //                               Row(
          //                                 children: [
          //                                   Text(snapshot.child('Zip').value.toString()),
          //                                 ],
          //                               ),
          //
          //
          //                               // Text(snapshot.child('Name').value.toString()),
          //                               // Text(snapshot.child('email').value.toString()),
          //                               // Text(snapshot.child('Phone Number').value.toString()),
          //                               // Text(snapshot.child('Address').value.toString()),
          //                               // Text(snapshot.child('Zip').value.toString()),
          //                               // Text(snapshot.child('Food Type').value.toString()),
          //                               // Text(snapshot.child('Quantity').value.toString()),
          //                             ],
          //                           ),
          //                           const SizedBox(width: 40,),
          //                           Container(
          //                             height: 50,
          //                             width: 100,
          //                             decoration: BoxDecoration(
          //                               color: Color(0xff6943ba),
          //                               borderRadius: BorderRadius.circular(10),
          //                             ),
          //                             child: InkWell(
          //                               child: const Center(
          //                                   child: Text( 'Practice' ,
          //                                     style: TextStyle(
          //                                       fontSize: 22,
          //                                       fontWeight: FontWeight.bold,
          //                                       fontFamily: 'Rubik Regular',
          //                                       color: Colors.white,
          //                                     ),
          //                                   )
          //                               ),
          //                               onTap: (){
          //                                 // Navigator.push( context,
          //                                 //     MaterialPageRoute(builder: (context)=>  ReceiverHomeScreen(true)));
          //                               },
          //                             ),
          //
          //
          //                           ),
          //
          //                           PopupMenuButton(
          //
          //                             icon: const Icon(Icons.more_vert),
          //                             itemBuilder: (context) =>[
          //                               PopupMenuItem(
          //                                   value:1,
          //                                   child: ListTile(
          //                                     onTap: (){
          //                                       Navigator.pop(context);
          //                                       showMyDialog(foodType,snapshot.child('id').value.toString());
          //                                     },
          //                                     leading: const Icon(Icons.edit),
          //                                     title: const Text('Edit'),
          //                                   )),
          //                               const PopupMenuItem(
          //                                   value:2,
          //                                   child: ListTile(
          //                                     leading: Icon(Icons.delete),
          //                                     title: Text('Delete'),
          //                                   ))
          //                             ],
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   )
          //                 ],
          //               );
          //             //   ListTile(
          //             //   title: Text(snapshot.child('Food Type').value.toString()),
          //             // );
          //
          //           }
          //           else{
          //             return Container();
          //           }
          //         }
          //     )
          // )
        ],
      ),
    );
  }

  Future<void> showMyDialog(String foodType, String id) async {
    editController.text = foodType;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              controller: editController,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.child(id).update({
                      'Food Type': editController.text.toLowerCase(),
                    }).then((value) {
                      utils().toastMessage('Updated');
                    }).onError((error, stackTrace) {
                      utils().toastMessage(error.toString());
                    });
                  },
                  child: const Text('Update'))
            ],
          );
        });
  }
}

class PublicFoodListTile extends StatelessWidget {
  const PublicFoodListTile({
    super.key,
    required this.snap,
  });

  final QueryDocumentSnapshot<Object?> snap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.appColor, width: 1.5),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                snap['name'],
                style: Theme.of(context).textTheme.headline2,
              ),
              Row(
                children: [
                  Text(
                    'Quantity: ',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: AppColors.appColor),
                  ),
                  Text(
                    snap['quantity'],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('food')
                    .doc(snap['id'])
                    .update({
                  'status': 'taken',
                  'takerId': FirebaseAuth.instance.currentUser?.uid,
                  'updatedAt': FieldValue.serverTimestamp()
                });
              },
              child: const Text('Take')),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('food')
                    .doc(snap['id'])
                    .update({
                  'status': 'reserved',
                  'takerId': FirebaseAuth.instance.currentUser?.uid,
                  'updatedAt': FieldValue.serverTimestamp()
                });
              },
              child: const Text('Reserve'))
        ],
      ),
    );
  }
}
