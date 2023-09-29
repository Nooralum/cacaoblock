import 'package:cacaoblock/constants.dart';
import 'package:cacaoblock/views/Accueil.dart';
import 'package:cacaoblock/views/bourse/bourses.dart';
import 'package:cacaoblock/views/seemore/seemore.dart';
import 'package:cacaoblock/views/transaction/transac.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EducationPage extends StatefulWidget {
  static const String id = 'education';
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? take;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserGet();
  }

  void UserGet() async{
    User? _Myuser = _auth.currentUser;
    var userCollect = await FirebaseFirestore.instance.collection('users').get();
   
   _Myuser!.email;
   userCollect.docs.forEach((doc) {
    print('Nom: ${doc.data()['name']}');

    for (var chic in userCollect.docs) {
      if (_Myuser.email == doc.data()["email"]) {
      setState(() {
        take = doc.data()["name"];
      });
      }
    }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 223, 226),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
             Row(
              children: [
                Icon(Icons.account_circle, size: 50,),
                Text(
                  'Bienvenue $take sur educFinance' , 
                  style: TextStyle(
                    fontSize: 20
                  ),)
              ],
             ),
             SizedBox(height: 15,),
             Container(
              width: 250,
               child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Rechercher un cours',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  )
                ),
               ),
             ),
             SizedBox(height: 20,),
            MesCours(txt: 'Introduction à la blockchain', file: 'assets/logos/livres.png',),
            SizedBox(height: 20,),
             MesCours(txt: 'Introduction à la blockchain', file: 'assets/logos/livres.png',),
             SizedBox(height: 20,),
             MesCours(txt: 'Introduction à la blockchain', file: 'assets/logos/livres.png',),
             SizedBox(height: 20,),
             MesCours(txt: 'Introduction à la blockchain', file: 'assets/logos/livres.png',),
             SizedBox(height: 20,),
             MesCours(txt: 'Introduction à la blockchain', file: 'assets/logos/livres.png',),
             SizedBox(height: 20,),
             MesCours(txt: 'Introduction à la blockchain', file: 'assets/logos/livres.png',),
            

            ],
          ),
          )
        ),
        bottomNavigationBar: bottomBar(
          onPressed1: HomeScreen.id, 
          onPressed2: TransactionPage.id, 
          onPressed3: BoursesPage.id, 
          onPressed4: VoirPlus.id,),
    );
  }
}

class MesCours extends StatelessWidget {
  const MesCours({
    super.key, required this.txt, required this.file,
  });
  final String txt;
  final String file;
  @override
  Widget build(BuildContext context) {
    return Container(
     width: 300,
     height: 60,
     decoration: BoxDecoration(
       color: kWhite,
       borderRadius: BorderRadius.all(Radius.circular(30))
     ),
     child: ElevatedButton(
       onPressed: (){},
       style: ElevatedButton.styleFrom(
         backgroundColor: kWhite,
         elevation: 15
       ),
       child: Row(
         children: [
           Image.asset(file, width: 33, height: 33,),
           SizedBox(width: 10,),
           Text(
             txt, 
             style: TextStyle(
               color: Colors.black,
               fontSize: 15
               ),
             
             )
         ],
       ),
     ),
    );
  }
}