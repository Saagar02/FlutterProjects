import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homerentalapp/Controller/list_of_house.dart';
import 'package:homerentalapp/View/widgets/cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hey Sagar",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(101, 101, 101, 1)),
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    "Assets/img/Profile.png",
                  ),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Let’s find your best\nresidence ",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search your favourite paradise",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            headersAndButtons(title: "Most popular", text: "See All"),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 310,
              child: ListView.builder(
                  itemCount: popularHouseList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildPopularHousCards(
                        context: context,
                        popularHouseList: popularHouseList,
                        index: index);
                  }),
            ),
            headersAndButtons(title: "Nearby your location", text: "More"),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return nearbyHousCard();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
