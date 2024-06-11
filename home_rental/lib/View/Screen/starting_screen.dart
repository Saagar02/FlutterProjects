import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homerentalapp/View/Screen/home_screen.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Container(
              width: double.infinity,
              height: 700,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("Assets/img/startingScreen.jpg"))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("Lets find your Paradise",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
                textAlign: TextAlign.center,
                "Find your perfect dream space\nwith just a few clicks",
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(101, 101, 101, 1))),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 50),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(32, 169, 247, 1),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Get Started",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
