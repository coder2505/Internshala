import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/firebase/firebaseAddDummyData.dart';
import 'package:internshala/designs/pages_designs/loginpage_start.dart';
import 'package:internshala/designs/pages_designs/recuitee_homepage.dart';
import 'package:internshala/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Firebaseadddummydata().addDummyData();
  runApp(ProviderScope(child: Internshala()));
}

class Internshala extends StatelessWidget {
  const Internshala({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,

      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const RecuiterHomepage();
          }
          return const LoginpageStart();
        },
      ),
    );
  }
}
