import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_donation_app/Services/session_manager.dart';
import 'package:food_donation_app/resources/color.dart';
import 'package:food_donation_app/button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_donation_app/Profile/profile_controller.dart';
import 'dart:io';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final ref= FirebaseDatabase.instance.ref('Data');
  CollectionReference _users = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.deepPurple.shade50,
        resizeToAvoidBottomInset: false,
        body: ChangeNotifierProvider(
          create: (_) => ProfileController(),
          child: Consumer<ProfileController>(
              builder: (context,provider,child){
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                        child: StreamBuilder(
                            stream: _users
                            .where('id',isEqualTo: _auth.currentUser!.uid)
                                .snapshots(),
                            builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                              if(!snapshot.hasData){
                                return Center(child: CircularProgressIndicator());
                              }
                              else if(snapshot.hasData){

                                return ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context,index){
                                    DocumentSnapshot users= snapshot.data!.docs[index];
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 20,),
                                        Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10),
                                              child: Container(
                                                height: 130,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: AppColors.successColor,
                                                      width: 3,
                                                    )
                                                ),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(100),
                                                    child:provider.image==null? users ['profile'].toString()==''?Icon(Icons.person,size: 40,):
                                                    Image(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        users ['profile'].toString(),
                                                      ),

                                                      loadingBuilder: (context, child, loadingProgress){
                                                        if(loadingProgress==null) return child;
                                                        return Center(child: CircularProgressIndicator());
                                                      },
                                                      errorBuilder: (context,object, stack){
                                                        return Container(
                                                          child: Icon(Icons.person, color: AppColors.primaryIconColor,),
                                                        );
                                                      },
                                                    ):
                                                    Image.file(
                                                        File(provider.image!.path).absolute
                                                    )
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                provider.pickImage(context);
                                              },
                                              child: CircleAvatar(
                                                radius: 14,
                                                backgroundColor: AppColors.lightGrayColor,
                                                child: Icon(Icons.add,size:18,color: AppColors.primaryIconColor,),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 40),
                                        Divider(color: AppColors.dividedColor.withOpacity(0.4),),
                                        GestureDetector(
                                            onTap: (){
                                              provider.showUserNameDialogueAlert(context, users['User Name']);
                                            },
                                            child: ReusableRow(
                                                title: 'User Name', value: users['User Name'], iconData: Icons.person)),
                                        Divider(color: AppColors.dividedColor.withOpacity(0.4),),
                                        GestureDetector(
                                            onTap: (){
                                              provider.showPhoneDialogueAlert(context, users['phone']);
                                            },
                                            child: ReusableRow(title: 'Phone', value: users['phone']==''?'xxxx-xxxxxxx':users['phone'], iconData: Icons.phone)),
                                        Divider(color: AppColors.dividedColor.withOpacity(0.4),),
                                        ReusableRow(title: 'Email', value: users['email'], iconData: Icons.mail),
                                        Divider(color: AppColors.dividedColor),

                                      ],
                                    );

                                    }
                                    );
                              }
                              else{
                                return Center(child: Text('Something Went Wrong', style: Theme.of(context).textTheme.subtitle1,));
                              }

                            }
                        )
                    ),
                  ),
                );
              }
          ),
        )
    );
  }
}
class ReusableRow extends StatelessWidget {
  final String title,value;
  final IconData iconData;
  const ReusableRow({Key? key, required this.title, required this.value,required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: Theme.of(context).textTheme.subtitle2,),
          leading: Icon(iconData,color: AppColors.successColor,),
          trailing: Text(value,style: Theme.of(context).textTheme.subtitle2,),
        ),
        // Divider(color: AppColors.dividedColor,),

      ],
    );
  }
}


// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   // final ref= FirebaseDatabase.instance.ref('Data');
//   // CollectionReference _users = FirebaseFirestore.instance.collection('users');
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: ChangeNotifierProvider(
//           create: (_) => ProfileController(),
//           child: Consumer<ProfileController>(
//               builder: (context,provider,child){
//                 return SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Center(
//                         child: StreamBuilder(
//                           stream: FirebaseFirestore.instance.collection('users')
//                               .where('id', isEqualTo: _auth.currentUser!.uid)
//                               .snapshots(),
//                             builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//                               return
//
//                                 ListView.builder(
//                                 itemCount: snapshot.data!.docs.length,
//                                   itemBuilder: (context,index){
//                                   DocumentSnapshot users= snapshot.data!.docs[index];
//                                   return ListTile(
//
//                                     leading: Text(users['email']),
//                                     title: Text(users['id']),
//                                     subtitle: Text(users['type']),
//                                   );
//
//                                   }
//                               );
//                             }
//                             )
//                     ),
//                   ),
//                 );
//               }
//           ),
//         )
//     );
//   }
// }
