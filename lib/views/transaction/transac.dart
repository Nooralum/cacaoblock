import 'package:cacaoblock/constants.dart';
import 'package:cacaoblock/views/Accueil.dart';
import 'package:cacaoblock/views/bourse/bourses.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  static const String id = 'transaction';
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 23, 73),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyText(
                  txt: 'Effectuer un transfert', 
                  color: kWhite, 
                  size: 25
                  ),
                  SizedBox(width: 20,),
                 CircleAvatar(
                  radius: 35,
                child: Icon(Icons.account_balance),
               )
              ],
             ),
             SizedBox(height: 20,),
             Text(
              'ID destinataire',
              style: TextStyle(
                color: kWhite,
                fontSize: 20,
              ),
             ),
             SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                labelText: 'ID Destinata',
                hintText: 'exp: JD2M0778898G' ,
                hintStyle: TextStyle(
                  color: kWhite,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kRose)
                  )
              ),
             ),

              Text(
               'Montant', 
               style: TextStyle(
                 color: kWhite,
                 fontSize: 20,
               ),
             ),
             SizedBox(height: 10,),
           Row(
            children: [
                Expanded(
                   child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            suffixIcon: MyText(txt: 'USD', color: kWhite, size: 25),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kRose)
                            )
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                           suffixIcon: MyText(txt: 'BTC', color: kWhite, size: 25),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kRose)
                            )
                          ),
                        ),
                      ),
              ],
             ),
             SizedBox(
              height: 15,
             ),
               TextButton(
                   onPressed: null, 
                  child: MyText(txt: 'Envoyer', size: 20, color: kWhite),
                  style:TextButton.styleFrom(
                   backgroundColor: Color.fromARGB(255, 154, 0, 101),
                   minimumSize: Size(150, 50),
                   ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(
        onPressed1: HomeScreen.id, 
        onPressed2: null, 
        onPressed3: BoursesPage.id, 
        onPressed4: null),
    );
  }
}