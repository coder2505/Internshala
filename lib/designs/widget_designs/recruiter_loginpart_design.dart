import 'package:flutter/material.dart';
import 'package:internshala/designs/widget_designs/email.dart';
import 'package:internshala/designs/widget_designs/password.dart';

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
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 69, 147, 72),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                height: 50,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: const Text("Login"),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
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
                      color: Colors.blueGrey,
                    ),
                    height: double.infinity,
                    width: width * 0.2,
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: Image.asset(
                            'lib/assets/images/googleicon.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.blueGrey,
                    ),
                    height: double.infinity,
                    width: width * 0.2,
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: Image.asset('lib/assets/images/microsoft.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.blueGrey,
                    ),
                    height: double.infinity,
                    width: width * 0.2,
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          child: Image.asset('lib/assets/images/facebook.jpg'),
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
