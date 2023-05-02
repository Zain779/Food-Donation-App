import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/resources/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonorSharedFoodScreen extends StatefulWidget {
  const DonorSharedFoodScreen({Key? key, this.isDonor = true})
      : super(key: key);

  final bool isDonor;

  @override
  State<DonorSharedFoodScreen> createState() => _DonorSharedFoodScreenState();
}

class _DonorSharedFoodScreenState extends State<DonorSharedFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.isDonor ? 'Shared Food' : 'Taken Food'),
      ),
      body: StreamBuilder(
        stream: widget.isDonor
            ? FirebaseFirestore.instance
                .collection('food')
                .where('giverId',
                    isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                .snapshots()
            : FirebaseFirestore.instance
                .collection('food')
                .where('takerId',
                    isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                .where('status', whereIn: ['reserved', 'taken']).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final snap = snapshot.data?.docs;
          return !snapshot.hasData
              ? const Center(child: Text('PLease Wait'))
              : snap!.isEmpty
                  ? const Center(
                      child: Text('No food available'),
                    )
                  : ListView.builder(
                      itemCount: snap.length,
                      itemBuilder: (context, index) {
                        return FoodListTile(
                            isDonor: widget.isDonor, snap: snap[index]);
                      },
                    );
        },
      ),
      // body: FirebaseAnimatedList(
      //     query: FirebaseDatabase.instance.ref('Data'),
      //     itemBuilder: (context, snapshot, animation, index) {
      //       if(snapshot.child('giverId').value == FirebaseAuth.instance.currentUser?.uid) {
      //         return Container(
      //           margin:const EdgeInsets.only(top: 20),
      //           padding: const EdgeInsets.all(8),
      //           decoration: BoxDecoration(
      //             border: Border.all(color: AppColors.appColor,width: 1.5)
      //           ),
      //           child: Row(
      //             children: [
      //               Column(
      //                 children: [
      //                   Text()
      //                 ],
      //               )
      //             ],
      //           ),
      //         );
      //       }else{
      //         return const SizedBox.shrink();
      //       }
      //     }),
    );
  }
}

class FoodListTile extends StatelessWidget {
  const FoodListTile({super.key, required this.snap, required this.isDonor});

  final QueryDocumentSnapshot<Object?> snap;
  final bool isDonor;

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
              // Text(
              //   snap['name'],
              //   style: Theme.of(context).textTheme.headline2,
              // ),
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
              Row(
                children: [
                  Text(
                    snap['food_type'],
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ],
          ),
          isDonor
              ? const SizedBox.shrink()
              : ElevatedButton(
                  onPressed: () async {
                    FirebaseFirestore.instance
                        .collection('food')
                        .doc(snap['id'])
                        .update({
                      'status': 'shared',
                      'takerId': FirebaseAuth.instance.currentUser?.uid,
                      'updatedAt': FieldValue.serverTimestamp()
                    });
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('lastSelectedTimestamp');
                  },
                  child: const Text('Release'))
        ],
      ),
    );
  }
}
