import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/Utils/utils.dart';
class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({Key? key}) : super(key: key);

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {


  final editController= TextEditingController();
  final fireStore= FirebaseFirestore.instance.collection('type').snapshots();
  CollectionReference ref =FirebaseFirestore.instance.collection('type');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15,),
          StreamBuilder<QuerySnapshot>(
            stream: fireStore,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){

              if (snapshot.connectionState== ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if(snapshot.hasError) {
                return const Text('Some error');
              }
              return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                            const SizedBox(height: 20,),

                            Container(width: 380,

                              decoration: BoxDecoration(
                                border: Border.all(width: 3,color: Colors.amber),
                                borderRadius: BorderRadius.circular(8),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [

                                    Column(
                                      children: [

                                        const SizedBox(height: 15,),
                                        Row(children: [
                                          const Icon(Icons.person_pin, color: Colors.amber,),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.data!.docs[index]['Name'].toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Icon(Icons.mail_outline_outlined, color: Colors.amber,),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.data!.docs[index]['email'].toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Icon(Icons.phone, color: Colors.amber,),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.data!.docs[index]['Phone Number'].toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Text('>Food Type :',style: TextStyle(fontWeight: FontWeight.bold),),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.data!.docs[index]['Food Type'].toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Text('>Quantity :',style: TextStyle(fontWeight: FontWeight.bold),),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.data!.docs[index]['Quantity'].toString()),
                                        ],
                                        ),
                                        Row(
                                          children: const [
                                            Text('Address',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontFamily: 'Rubik Regular',
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.amber)
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.data!.docs[index]['Address'].toString()),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.data!.docs[index]['Zip'].toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 40,),
                                    Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        child: const Center(
                                            child: Text( 'Practice' ,
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Rubik Regular',
                                                color: Colors.white,
                                              ),
                                            )
                                        ),
                                        onTap: (){
                                          Navigator.push( context,
                                              MaterialPageRoute(builder: (context)=> const FireStoreScreen()));
                                        },
                                      ),


                                    ),
                                    PopupMenuButton(

                                      icon: const Icon(Icons.more_vert),
                                      itemBuilder: (context) =>[
                                        PopupMenuItem(
                                            value:1,
                                            child: ListTile(
                                              onTap: (){
                                                Navigator.pop(context);
                                                ref.doc(snapshot.data!.docs[index]['id'].toString()).update({});
                                                // showMyDialog(foodType,snapshot.data!.docs[index]['id'].toString());
                                              },
                                              leading: const Icon(Icons.edit),
                                              title: const Text('Edit'),
                                            )),
                                        PopupMenuItem(
                                            value:2,
                                            child: ListTile(
                                              onTap: (){
                                                Navigator.pop(context);

                                              },
                                              leading: const Icon(Icons.delete),
                                              title: const Text('Delete'),
                                            ))
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }
                  )
              );
              }
          ),


        ],
      ),

    );
  }
  Future<void> showMyDialog(String foodType, String id)async{
    editController.text= foodType;
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              controller: editController,
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('Cancel')),
              TextButton(onPressed: (){
                Navigator.pop(context);
                ref.doc(id).update(
                    {
                      'Food Type': editController.text.toLowerCase(),

                    }).then((value) {
                  utils().toastMessage('Updated');
                }).onError((error, stackTrace) {
                  utils().toastMessage(error.toString());
                });

              }, child: const Text('Update'))
            ],
          );
        }
    );

  }
}
