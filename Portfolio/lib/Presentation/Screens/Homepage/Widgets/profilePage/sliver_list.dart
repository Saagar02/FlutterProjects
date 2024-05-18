// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../../Declarations/constants.dart';

class SliverListBldr extends StatelessWidget {
  const SliverListBldr({
    Key? key,
  }) : super(key: key);

  final certificationList = const[
    'assets/Images/Java.png',
    'assets/Images/Os.png',
    'assets/Images/C.jpg',
    'assets/Images/Cpp.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate:
        SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(left: 12.5, bottom: 20, right: 12.5),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(73, 173, 159, 159),
                      spreadRadius: 5,
                      offset: Offset(0,0)
                    )
                  ],
                  //borderRadius: kBorderRadius,
                  color: secondaryColor.withOpacity(0.3),
                ),
                height:300,
                width: 50,

                child: Image.asset(certificationList[index],fit: BoxFit.fill,),
              ),
            );
          },
          childCount: 4,
        ),
    );
  }
}
