import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homerentalapp/Controller/list_of_house.dart';
import 'package:homerentalapp/View/widgets/cards.dart';
import 'package:svg_flutter/svg.dart';

class HouseDitail extends StatefulWidget {
  final int index;
  final List popularHouseList;
  const HouseDitail(
      {required this.index, required this.popularHouseList, super.key});

  @override
  State<HouseDitail> createState() => _HouseDitailState();
}

class _HouseDitailState extends State<HouseDitail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("Assets/icon/backArrow.svg"),
          ),
        ),
        title: Text(
          "Details",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 244,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              popularHouseList[widget.index]["image"]))),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: buildReating(
                      popularHouseList: popularHouseList, index: widget.index),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popularHouseList[widget.index]['name'],
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        popularHouseList[widget.index]['loction'],
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(101, 101, 101, 1)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        popularHouseList[widget.index]["prise"],
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(32, 169, 247, 1)),
                      ),
                      Text(
                        " /mont",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(101, 101, 101, 1)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 140,
              child: Row(
                children: [
                  Expanded(
                      flex: 3, child: buildBadInfoCard(index: widget.index)),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      flex: 3, child: buildBathInfoCard(index: widget.index)),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      flex: 3, child: buildAreaInfoCard(index: widget.index))
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: SizedBox(
                  child: Text(
                    popularHouseList[widget.index]["discription"].toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          color: const Color.fromARGB(228, 255, 255, 255),
          width: double.infinity,
          height: 115,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 110),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 50),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(32, 169, 247, 1),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Rent Now",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )),
    );
  }
}
