// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cacaoblock/views/seemore/seemore.dart';
import 'package:flutter/material.dart';

import 'package:cacaoblock/constants.dart';
import 'package:cacaoblock/views/Accueil.dart';
import 'package:cacaoblock/views/transaction/transac.dart';

class BoursesPage extends StatefulWidget {
  static const String id = 'boursePage';
  const BoursesPage({super.key});

  @override
  State<BoursesPage> createState() => _BoursesPageState();
}


class _BoursesPageState extends State<BoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 23, 73),
      body: Container(
        height: 392,
        color: Color.fromARGB(255, 37, 42, 73),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     MyText(txt: 'Voir les bourses', color: kWhite, size: 25),
                     SizedBox(width: 15,),
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.account_balance),
                    ),
      
                  ],
                ),
                SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      MyText(txt: 'Balance', color: kWhite, size: 20),
                      MyText(txt: '\$12345679', color: kWhite, size: 25)
                    ],
                  
                  ),
                  MyText(txt: '+2.23', color: Colors.green, size: 20),
                 
                ],
              ),
              SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                     onPressed: null, 
                    child: Row(
                      children: [
                        MyText(txt: 'Achat', size: 20, color: kWhite),
                        
                      ],
                    ),
                    style:TextButton.styleFrom(
                     backgroundColor: Color.fromARGB(255, 154, 0, 101),
                     minimumSize: Size(150, 50),
                     ),
                  ),
                  SizedBox(width: 10,),
                  TextButton(
                     onPressed: null, 
                    child: Row(
                      children: [
                        MyText(txt: 'Vente', size: 20, color: kWhite),
                      ],
                    ),
                    style:TextButton.styleFrom(
                     backgroundColor: kRose,
                     minimumSize: Size(150, 50),
                     ),
                  ),
                ],
              ),
      
             SizedBox(
              height: 100,
               child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: Row(
                   children: [
                     textbtn(txt: Text('PALMCI'),),
                     textbtn(txt: Text('CACAO'),),
                     textbtn(txt: Text('PETROLE/GAZ'),),
                     textbtn(txt: Text('PALMCI'),),
                     textbtn(txt: Text('PALMCI'),),
                     textbtn(txt: Text('PALMCI'),),
                
               
                   ],
                 ),
               ),
             )
              ],
            ),
            )
          ),
      ),
        bottomNavigationBar: bottomBar(
          onPressed1: HomeScreen.id, 
          onPressed2: TransactionPage.id, 
          onPressed3: null, 
          onPressed4: VoirPlus.id,
          ),
    );
  }
}

class textbtn extends StatefulWidget {
   textbtn({
    required this.txt
   } );
  final Text txt;

  @override
  State<textbtn> createState() => _textbtnState();
}

class _textbtnState extends State<textbtn> {
  bool _autoFocus = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
      setState(() {
        
        if (_autoFocus = true) {
        Color(20);
      } else{
        Color.fromARGB(0, 47, 47, 159);
      }
      });
      },
     
     child: widget.txt,
     );
  }
}
