import 'package:cacaoblock/firebase_options.dart';
import 'package:cacaoblock/views/Accueil.dart';
import 'package:cacaoblock/views/authenticate.dart/connection.dart';
import 'package:cacaoblock/views/bourse/bourses.dart';
import 'package:cacaoblock/views/education/educFinance.dart';
import 'package:cacaoblock/views/seemore/seemore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'views/authenticate.dart/inscription.dart';
import 'views/transaction/transac.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: EducationPage.id,
      routes: {
        Connection.id:(context) => Connection(),
        HomeScreen.id:(context) => HomeScreen(),
        RegisterPage.id:(context) => RegisterPage(),
        TransactionPage.id:(context) => TransactionPage(),
        BoursesPage.id:(context) => BoursesPage(),
        VoirPlus.id:(context) => VoirPlus(),
        EducationPage.id:(context) => EducationPage(),
      },

    );
  }
}