import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginpageStart extends StatefulWidget {
  const LoginpageStart({super.key});

  @override
  State<LoginpageStart> createState() => _LoginpageStartState();
}

class _LoginpageStartState extends State<LoginpageStart> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: height * 0.1,
            left: width * 0.05,
            right: width * 0.05,
            bottom: height * 0.5,
            child: SizedBox(
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Learn.",
                          style: GoogleFonts.merriweather(fontSize: 65),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "Intern.",
                          style: GoogleFonts.merriweather(
                            fontSize: 65,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Repeat.",
                          style: GoogleFonts.merriweather(fontSize: 60),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.55,
            bottom: height * 0.2,
            left: 0,
            right: 0,
            child: SizedBox(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 27, 27, 27),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "I am looking to get hired!",
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: AnimatedOpacity(
                          opacity: 1,
                          duration: Duration(seconds: 1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 27, 27, 27),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "I am looking to hire !",
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
