import 'package:flutter/material.dart';

class Showbottomsheet {
  static void showSheet(BuildContext context){
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
        ),
        side: BorderSide(color: Colors.white)
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context , setstate){
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("Expense Manager",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            );
          }
        
        );
      });
  }
}