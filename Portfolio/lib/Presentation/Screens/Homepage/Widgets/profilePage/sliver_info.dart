import 'package:flutter/material.dart';

class sliverInfo extends StatelessWidget{

  const sliverInfo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context){
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, index){
          return Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              height: 500.0,
              width: 50,
              color: Colors.white,
              child: Center(
                  child: Text('Item $index'),
              ),
            ),
          );
        }, 
        childCount: 5,
      )
    );
  }
}