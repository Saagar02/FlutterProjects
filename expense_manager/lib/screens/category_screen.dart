import 'package:expense_manager/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  
    List widgets = [
      Container(
          height: 145,
          width: 150,
          color: Colors.red,
        ),
        Container(
          height: 155,
          width: 150,
          color: Colors.yellow,
        ),
        Container(
          height: 145,
          width: 150,
          color: Colors.purple,
        ),
        Container(
          height: 145,
          width: 150,
          color: Colors.pink,
        ),
        
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "June 2022",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.search),
            ),
          ],
        ),
        drawer: const Sidebar(),
        body:Container(
        
          child: Padding(
            padding: const EdgeInsets.only(
              right: 23,
              left: 23,
              top: 40,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 1.0,
            ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0,0.8),
                        offset: Offset(1,2),
                        blurRadius: 8
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(14))
                  ),
                );
              },
            ),
          ),
        )
    );
  }
}