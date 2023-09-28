import 'package:cacaoblock/constants.dart';
import 'package:cacaoblock/views/Accueil.dart';
import 'package:cacaoblock/views/transaction/transac.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
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
                   backgroundColor: Color.fromARGB(255, 154, 0, 101),
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
        bottomNavigationBar: bottomBar(
          onPressed1: HomeScreen.id, 
          onPressed2: TransactionPage.id, 
          onPressed3: null, 
          onPressed4: null
          ),
    );
  }
}

class textbtn extends StatelessWidget {
  const textbtn({
    super.key, required this.txt,
  });
  final Text txt;

  @override
  Widget build(BuildContext context) {
    return TextButton(
     onPressed: (){}, 
     child: txt,
     );
  }
}