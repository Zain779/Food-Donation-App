import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final String title;
  const Button({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xfff6943ba),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text( title ,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rubik Regular',
                color: Colors.white
            ),
          )
      ),
    );
  }
}
