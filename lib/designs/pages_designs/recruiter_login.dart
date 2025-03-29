import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala/designs/widget_designs/recruiter_loginpart_design.dart';
import 'package:internshala/designs/widget_designs/recruiter_signup_design.dart';
import 'package:internshala/riverpod/login_button_listener.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RecruiterLoginPage extends ConsumerStatefulWidget {
  const RecruiterLoginPage({super.key});

  @override
  ConsumerState<RecruiterLoginPage> createState() => _RecruiterLoginPageState();
}

class _RecruiterLoginPageState extends ConsumerState<RecruiterLoginPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(isLoginPressedProvider);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        // list of colors genrated by ai to smoothely transistion to one to another
                        Color(0xFF2196F3),
                        Color(0xFF1869AB),
                        Color(0xFF155A93),
                        Color(0xFF124B7B),
                        Color(0xFF0F3C63),
                        Color(0xFF0C2D4B),
                        Color(0xFF091E33),
                        Color(0xFF060F1B),
                        Color(0xFF000000),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      width * 0.06,
                      height * 0.06,
                      width * 0.06,
                      0,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: width,
                            height: height * 0.06,
                            child: Text(
                              "One Step Closer",
                              style: GoogleFonts.merriweather(
                                fontSize: width * 0.0865,
                                color: const Color.fromARGB(175, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width,
                          height: height * 0.1,
                          child: Text(
                            'To Your Dream Job',
                            style: GoogleFonts.merriweather(
                              fontSize: width * 0.092,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 18, 29),
                    border: Border(
                      top: BorderSide(
                        color: const Color.fromARGB(255, 157, 156, 156),
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                        child: Container(
                          height: height * 0.07,
                          width: width,

                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 4, 27, 46),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),

                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        ref
                                                .read(
                                                  isLoginPressedProvider
                                                      .notifier,
                                                )
                                                .returnLoginState()
                                            ? const Color.fromARGB(
                                              255,
                                              15,
                                              73,
                                              121,
                                            )
                                            : Colors.transparent,
                                    minimumSize: Size.infinite,
                                  ),
                                  onPressed: () {
                                    ref
                                        .read(isLoginPressedProvider.notifier)
                                        .toggleLogin();
                                  },
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        !ref
                                                .read(
                                                  isLoginPressedProvider
                                                      .notifier,
                                                )
                                                .returnLoginState()
                                            ? const Color.fromARGB(
                                              255,
                                              15,
                                              73,
                                              121,
                                            )
                                            : Colors.transparent,
                                    minimumSize: Size.infinite,
                                  ),
                                  onPressed: () {
                                    ref
                                        .read(isLoginPressedProvider.notifier)
                                        .toggleSignUp();
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child:
                            // LOG IN
                            ref
                                    .read(isLoginPressedProvider.notifier)
                                    .returnLoginState()
                                ? RecruiterLoginpartDesign()
                                :
                                // SIGN UP
                                RecruiterSignupDesign(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLogInContent() {
    return Text("YESSS", style: TextStyle(color: Colors.white));
  }

  Widget buildSignUpContent() {
    return Text("NOOOO", style: TextStyle(color: Colors.white));
  }
}
