import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homerentalapp/Controller/list_of_house.dart';
import 'package:homerentalapp/View/Screen/details_page.dart';
import 'package:svg_flutter/svg.dart';

Widget buildReating({required List popularHouseList, required int index}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(32, 169, 247, 1)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: Color.fromRGBO(251, 227, 12, 1)),
        Text(
          popularHouseList[index]['retting'],
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

Widget buildPopularHousCards(
    {required BuildContext context,
    required List popularHouseList,
    required int index}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => HouseDitail(
                index: index,
                popularHouseList: popularHouseList,
              )));
    },
    child: Container(
      margin: const EdgeInsets.only(right: 20),
      height: 310,
      width: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 196,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(popularHouseList[index]["image"]))),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 130),
                  child: buildReating(
                      popularHouseList: popularHouseList, index: index)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  popularHouseList[index]["name"],
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  popularHouseList[index]["loction"],
                  // "",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(101, 101, 101, 1)),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      popularHouseList[index]["prise"],
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(32, 169, 247, 1)),
                    ),
                    Text(
                      "/mont",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(101, 101, 101, 1)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget headersAndButtons({required String title, required String text}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(32, 169, 247, 1)),
      )
    ],
  );
}

Widget nearbyHousCard() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    padding: const EdgeInsets.all(10),
    height: 108,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: Row(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("Assets/img/house3.jpeg"))),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jumeriah Golf Estates Villa",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Icon(Icons.location_on),
                  SvgPicture.asset("lib/Assets/icon/map-pin.svg"),
                  Text(
                    " London,Area Plam Jumeriah",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(101, 101, 101, 1)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("Assets/icon/bedrooms.svg"),
                  Text(
                    " 4 Bedrooms",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(101, 101, 101, 1)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset("Assets/icon/bathrooms.svg"),
                  Text(
                    " 5 Bathrooms",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(101, 101, 101, 1)),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildBadInfoCard({
  required int index,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: SvgPicture.asset("Assets/icon/bedrooms.svg"),
        ),
        Text(
          "Bedrooms",
          style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(101, 101, 101, 1)),
        ),
        Text(
          popularHouseList[index]["Bedrooms"].toString(),
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    ),
  );
}

Widget buildBathInfoCard({
  required int index,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: SvgPicture.asset("Assets/icon/bathrooms.svg"),
        ),
        Text(
          "Bathrooms",
          style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(101, 101, 101, 1)),
        ),
        Text(
          popularHouseList[index]["Bathrooms"].toString(),
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    ),
  );
}

Widget buildAreaInfoCard({required int index}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: SvgPicture.asset("Assets/icon/squareft.svg"),
        ),
        Text(
          "Square ft",
          style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(101, 101, 101, 1)),
        ),
        Text(
          popularHouseList[index]["Square ft"].toString(),
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    ),
  );
}
