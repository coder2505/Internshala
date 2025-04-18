import 'package:flutter/material.dart';
import 'package:internshala/assets/utils/FirebaseFunctions.dart';
import 'package:internshala/assets/utils/services/googleauthoptions.dart';
import 'package:internshala/designs/widget_designs/email.dart';
import 'package:internshala/designs/widget_designs/password.dart';
import 'package:internshala/global_variables.dart';

class RecruiterLoginpartDesign extends StatefulWidget {
  const RecruiterLoginpartDesign({super.key});

  @override
  State<RecruiterLoginpartDesign> createState() =>
      _RecruiterLoginpartDesignState();
}

class _RecruiterLoginpartDesignState extends State<RecruiterLoginpartDesign> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      child: Column(
        children: [
          Email(),
          SizedBox(height: 4),
          Password(),
          SizedBox(height: 24),

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                Firebasefunctions obj = Firebasefunctions();
                obj.loginuserwithemailandpassword(
                  GlobalVariables().emailBox,
                  GlobalVariables().passwordBox,
                  context,
                );
                GlobalVariables().emailBox = "";
                GlobalVariables().passwordBox = "";
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 46, 137, 49),
                      const Color.fromARGB(255, 21, 93, 153),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    tileMode: TileMode.clamp,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                height: 60,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Login", style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Or Login With",
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.15, 8, width * 0.15, 0),

            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: const Color.fromARGB(72, 15, 73, 121),
                    ),
                    height: double.infinity,
                    width: width * 0.2,
                    child: GestureDetector(
                      onTap: () {
                        GoogleAuthOptions().loginwithgoogle(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: Image.asset(
                            'lib/assets/images/googleicon.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: const Color.fromARGB(72, 15, 73, 121),
                    ),
                    height: double.infinity,
                    width: width * 0.2,
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: Image.asset('lib/assets/images/microsoft.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: const Color.fromARGB(72, 15, 73, 121),
                    ),
                    height: double.infinity,
                    width: width * 0.2,
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Image.asset(
                            'lib/assets/images/facebookpic.png',
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
