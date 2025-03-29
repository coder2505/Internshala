import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/designs/widget_designs/recruiter_loginpart_design.dart';
import 'package:internshala/riverpod/login_button_listener.dart';

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
          // Positioned(
          //   top: 0,
          //   child: Container(
          //     height: height * 0.275,
          //     width: width,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: [
          //           // list of colors genrated by ai to smoothely transistion to one to another
          //           Color(0xFF2196F3),
          //           Color(0xFF1869AB),
          //           Color(0xFF155A93),
          //           Color(0xFF124B7B),
          //           Color(0xFF0F3C63),
          //           Color(0xFF0C2D4B),
          //           Color(0xFF091E33),
          //           Color(0xFF060F1B),
          //           Color(0xFF000000),
          //         ],
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         tileMode: TileMode.clamp,
          //       ),
          //     ),
          //   ),
          // ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.275,
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
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

                // SizedBox(
                //   height: height * 0.35,
                //   child: Padding(
                //     padding: EdgeInsets.fromLTRB(
                //       width * 0.03,
                //       height * 0.06,
                //       0,
                //       0,
                //     ),
                //     child: Align(
                //       alignment: Alignment.topLeft,
                //       child: IconButton(
                //         icon: Icon(Icons.arrow_back, color: Colors.white),
                //         onPressed: () {
                //           Navigator.pop(context);
                //         },
                //       ),
                //     ),
                //   ),
                // ),
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
                                            ? Colors.blue
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
                                            ? Colors.blue
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
                                Text("what"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Positioned(
          //   top: height * 0.05, // Adjust for status bar spacing
          //   left: width * 0.01,
          //   child: IconButton(
          //     icon: Icon(Icons.arrow_back, color: Colors.white),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
          // Positioned( DONE
          //   top: height * 0.25,
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       // color: Colors.red,
          //       color: const Color.fromARGB(255, 0, 18, 29),
          //       border: Border(
          //         top: BorderSide(
          //           color: const Color.fromARGB(255, 157, 156, 156),
          //         ),
          //       ),
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(50),
          //         topRight: Radius.circular(50),
          //       ),
          //     ),
          //   ),
          // ),

          // Positioned( DONE
          //   top: height * 0.3,
          //   bottom: height * 0.64,
          //   left: width * 0.05,
          //   right: width * 0.05,

          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: const Color.fromARGB(255, 4, 27, 46),
          //       borderRadius: BorderRadius.all(Radius.circular(30)),
          //     ),
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child: TextButton(
          //             style: TextButton.styleFrom(
          //               backgroundColor:
          //                   ref
          //                           .read(isLoginPressedProvider.notifier)
          //                           .returnLoginState()
          //                       ? Colors.blue
          //                       : Colors.transparent,
          //               minimumSize: Size.infinite,
          //             ),
          //             onPressed: () {
          //               ref.read(isLoginPressedProvider.notifier).toggleLogin();
          //             },
          //             child: Text(
          //               "Log In",
          //               style: TextStyle(color: Colors.white),`
          //             ),
          //           ),
          //         ),
          //         Expanded(
          //           child: TextButton(
          //             style: TextButton.styleFrom(
          //               backgroundColor:
          //                   !ref
          //                           .read(isLoginPressedProvider.notifier)
          //                           .returnLoginState()
          //                       ? Colors.blue
          //                       : Colors.transparent,
          //               minimumSize: Size.infinite,
          //             ),
          //             onPressed: () {
          //               ref
          //                   .read(isLoginPressedProvider.notifier)
          //                   .toggleSignUp();
          //             },
          //             child: Text(
          //               "Sign Up",
          //               style: TextStyle(color: Colors.white),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: height * 0.38,
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: AnimatedSwitcher(
          //     duration: Duration(milliseconds: 500),
          //     child:
          //         // LOG IN
          //         ref.read(isLoginPressedProvider.notifier).returnLoginState()
          //             ? RecruiterLoginpartDesign()
          //             :
          //             // SIGN UP
          //             Text("what"),
          //   ),
          // ),
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
