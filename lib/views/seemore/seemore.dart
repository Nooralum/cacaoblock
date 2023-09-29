import 'package:cacaoblock/constants.dart';
import 'package:cacaoblock/views/Accueil.dart';
import 'package:cacaoblock/views/bourse/bourses.dart';
import 'package:cacaoblock/views/education/educFinance.dart';
import 'package:cacaoblock/views/transaction/transac.dart';
import 'package:flutter/material.dart';

class VoirPlus extends StatefulWidget {
  static const String id = 'seemore';
  const VoirPlus({super.key});

  @override
  State<VoirPlus> createState() => _VoirPlusState();
}

class _VoirPlusState extends State<VoirPlus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 23, 73),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Appbar(txt1: 'Voir plus', icon: Icon(Icons.account_balance)),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      sizebox(txt: 'Education financière', icon: Icon(Icons.school_outlined), navigator: EducationPage.id,),
                       SizedBox(width: 20,),
                      sizebox(txt: 'Demande de prêt', icon: Icon(Icons.check)),
                      
                    ],
                  ),
                ),
              )

            ],
          ),
          )
        ),
        bottomNavigationBar: bottomBar(
          onPressed1: HomeScreen.id, 
          onPressed2: TransactionPage.id, 
          onPressed3: BoursesPage.id, 
          onPressed4: null,),
    );
  }
}

class sizebox extends StatelessWidget {
  const sizebox({
    super.key, required this.txt, required this.icon, this.navigator,
  });
  final String txt;
  final Icon icon;
  final navigator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 37, 42, 73),
          elevation: 25,
        ),
        onPressed: (){
          Navigator.pushReplacementNamed(context, navigator);
        }, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Text(txt)
          ],
        )
        ),
    );
  }
}