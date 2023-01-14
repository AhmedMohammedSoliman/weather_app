import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FootBallWidget extends StatelessWidget {

  String statium ;
  String match ;
  String country ;
  String start ;
  String image ;

  FootBallWidget({required this.statium , required this.match , required this.country , required this.start ,
  required this.image});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(country , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
        Container(
          width: 150 , height: 150,
          clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
            ),
            child: Image(image: AssetImage(image))),
        Text(statium , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
        Text(match , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
        Text(start , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
      ],
    );
  }
}
