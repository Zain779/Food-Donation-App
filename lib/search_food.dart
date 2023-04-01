import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_donation_app/practice.dart';
class SearchFood extends StatefulWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  State<SearchFood> createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  // String Name='', Email='', Phone_Number='', Address='', Zip='', Food_Type='', Quantity='';
    @override
  //   void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   loadData();
  // }
  // loadData()async{
  //     SharedPreferences sp= await SharedPreferences.getInstance();
  //     Name=sp.getString('Name') ?? '';
  //     Email=sp.getString('email') ?? '';
  //     Phone_Number=sp.getString('Phone Number') ?? '';
  //     Address=sp.getString('Address') ?? '';
  //     Zip=sp.getString('Zip') ?? '';
  //     Food_Type =sp.getString('Food Type') ?? '';
  //     Quantity = sp.getString('Quantity') ?? '';
  //     setState(() {
  //
  //     });
  // }
  final ref = FirebaseDatabase.instance.ref('Data');
    final searchFilter= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 35,),
          const Text('Available Food',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Rubik Regular',
                  fontWeight: FontWeight.bold,
                  color: Color(0xfff6943ba))
          ),
          // Text(Name.toString()),
          // Text(Email.toString()),
          // Text(Phone_Number.toString()),
          // Text(Address.toString()),
          // Text(Zip.toString()),
          // Text(Food_Type.toString()),
          // Text(Quantity.toString()),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchFilter,
              decoration: InputDecoration(
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
              onChanged: (String value){
                setState(() {

                });
              },
            ),
          ),
          Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index){
                    final foodType = snapshot.child('Food Type').value.toString();
                    if(searchFilter.text.isEmpty){
                      return
                        Column(
                          children: [
                            const SizedBox(height: 20,),

                            Container(width: 380,

                              decoration: BoxDecoration(
                                border: Border.all(width: 3,color: Color(0xff6943ba)),
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
                                          const Icon(Icons.person_pin, color: Color(0xff6943ba),),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.child('Name').value.toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Icon(Icons.mail_outline_outlined, color: Color(0xff6943ba),),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.child('email').value.toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Icon(Icons.phone, color: Color(0xff6943ba),),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.child('Phone Number').value.toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Text('>Food Type :',style: TextStyle(fontWeight: FontWeight.bold),),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.child('Food Type').value.toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Text('>Quantity :',style: TextStyle(fontWeight: FontWeight.bold),),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.child('Quantity').value.toString()),
                                        ],
                                        ),
                                        Row(
                                          children: const [
                                            Text('Address',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontFamily: 'Rubik Regular',
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff6943ba))
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.child('Address').value.toString()),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.child('Zip').value.toString()),
                                          ],
                                        ),


                                        // Text(snapshot.child('Name').value.toString()),
                                        // Text(snapshot.child('email').value.toString()),
                                        // Text(snapshot.child('Phone Number').value.toString()),
                                        // Text(snapshot.child('Address').value.toString()),
                                        // Text(snapshot.child('Zip').value.toString()),
                                        // Text(snapshot.child('Food Type').value.toString()),
                                        // Text(snapshot.child('Quantity').value.toString()),
                                      ],
                                    ),
                                    const SizedBox(width: 40,),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xff6943ba),
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
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=> const Practice()));
                                        },
                                      ),


                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );

                      // ListTile(
                      //   title: Text(snapshot.child('Food Type').value.toString()),
                      // );
                    }
                    else if(foodType.toLowerCase().contains(searchFilter.text.toLowerCase().toLowerCase())){
                      return
                        Column(
                          children: [
                            const SizedBox(height: 20,),

                            Container(width: 380,

                              decoration: BoxDecoration(
                                border: Border.all(width: 3,color: Color(0xff6943ba)),
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
                                          const Icon(Icons.person_pin, color: Color(0xff6943ba)),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.child('Name').value.toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Icon(Icons.mail_outline_outlined, color: Color(0xff6943ba)),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.child('email').value.toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Icon(Icons.phone, color: Color(0xff6943ba)),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.child('Phone Number').value.toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Text('>Food Type :',style: TextStyle(fontWeight: FontWeight.bold),),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.child('Food Type').value.toString()),
                                        ],
                                        ),
                                        Row(children: [
                                          const Text('>Quantity :',style: TextStyle(fontWeight: FontWeight.bold),),
                                          const SizedBox(width: 5,),
                                          Text(snapshot.child('Quantity').value.toString()),
                                        ],
                                        ),
                                        Row(
                                          children: const [
                                            Text('Address',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontFamily: 'Rubik Regular',
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff6943ba))
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.child('Address').value.toString()),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.child('Zip').value.toString()),
                                          ],
                                        ),


                                        // Text(snapshot.child('Name').value.toString()),
                                        // Text(snapshot.child('email').value.toString()),
                                        // Text(snapshot.child('Phone Number').value.toString()),
                                        // Text(snapshot.child('Address').value.toString()),
                                        // Text(snapshot.child('Zip').value.toString()),
                                        // Text(snapshot.child('Food Type').value.toString()),
                                        // Text(snapshot.child('Quantity').value.toString()),
                                      ],
                                    ),
                                    const SizedBox(width: 40,),
                                    Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xff6943ba),
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
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=> const Practice()));
                                        },

                                      ),


                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      //   ListTile(
                      //   title: Text(snapshot.child('Food Type').value.toString()),
                      // );

                    }
                    else{
                      return Container();
                    }

                  })
          )

        ],
      ),
    );
  }
}
