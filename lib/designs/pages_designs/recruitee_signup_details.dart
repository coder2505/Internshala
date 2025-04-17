import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala/assets/utils/FirebaseFunctions.dart';
import 'package:internshala/designs/widget_designs/recruitee_signup_details_designs/name_textboxes.dart';
import 'package:internshala/designs/widget_designs/recruitee_signup_details_designs/recruitee_signup_details_city.dart';
import 'package:internshala/designs/widget_designs/recruitee_signup_details_designs/recruitee_signup_details_contactno.dart';
import 'package:internshala/designs/widget_designs/recruitee_signup_details_designs/recruitee_signup_details_gender.dart';
import 'package:internshala/designs/widget_designs/recruitee_signup_details_designs/recruitee_signup_details_languages.dart';
import 'package:internshala/designs/widget_designs/recruitee_signup_details_designs/recruitee_signup_details_type.dart';
import 'package:internshala/global_variables.dart';
import 'package:internshala/riverpod/signup_details.dart';

class RecruiteeSignupDetails extends ConsumerStatefulWidget {
  const RecruiteeSignupDetails({super.key});

  @override
  ConsumerState<RecruiteeSignupDetails> createState() =>
      _RecruiteeSignupDetailsState();
}

class _RecruiteeSignupDetailsState
    extends ConsumerState<RecruiteeSignupDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.2,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: width,
                      height: height * 0.06,
                      child: Text(
                        "Confirm Your Details",
                        style: GoogleFonts.merriweather(
                          fontSize: width * 0.08,
                          color: const Color.fromARGB(175, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 18, 29),
                border: Border(
                  top: BorderSide(
                    color: const Color.fromARGB(255, 157, 156, 156),
                  ),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),

              child: Column(
                children: [
                  // NAMES - FIRST AND LAST NAME
                  NameTextboxes().design(width, height),
                  // EMAIL
                  // CONTACT NUMBER
                  RecruiteeSignupDetailsContactno().design(width, height),
                  // CURRENT CITY
                  RecruiteeSignupDetailsCity().design(width, height),
                  //GENDER
                  RecruiteeSignupDetailsGender().design(width, height, ref),
                  //LANGUAGES
                  RecruiteeSignupDetailsLanguages().design(width, height, ref),
                  //TYPE
                  RecruiteeSignupDetailsType().design(width, height, ref),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 32, 8, 16),
                    child: Container(
                      height: height * 0.08,
                      width: width * 0.8,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 21, 93, 153),
                            Color(0xFF060F1B),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: GestureDetector(
                        onTap: () {
                          Firebasefunctions().createUserDocument(
                            GlobalVariables.firstName,
                            GlobalVariables.lastName,
                            GlobalVariables.contactNumber,
                            GlobalVariables.currentCity,
                            "${ref.read(genderProvider.notifier).getState()}",
                            ref.read(langProvider.notifier).getstate(),
                            "${ref.read(typeProvider.notifier).state}",
                            context,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Next",
                              style: GoogleFonts.ibmPlexSans(fontSize: 28),
                            ),
                            Icon(Icons.arrow_right, size: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
