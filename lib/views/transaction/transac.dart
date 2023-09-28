import 'package:cacaoblock/constants.dart';
import 'package:cacaoblock/views/Accueil.dart';
import 'package:cacaoblock/views/bourse/bourses.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  static const String id = 'transaction';
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}


 

class _TransactionPageState extends State<TransactionPage> {
   FirebaseFirestore _firestore = FirebaseFirestore.instance;
   final int _montant = 0;
   final String id_destinataire = "";


   Future<void> addTransaction() async{
    try {
      await _firestore.runTransaction((transaction) async {

        final refTransaction = _firestore.collection("moneysend");


        final newDocumentReference = refTransaction.doc();

        final transactionData = {
        'montant': _montant,
        'idDest': id_destinataire,
        'timestamp': FieldValue.serverTimestamp(),
      };
      transaction.set(newDocumentReference, transactionData);

      } );
      
    } catch (e) {
       print('Erreur lors de l\'enregistrement de la transaction : $e');
      
    }
   }
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
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 37, 42, 73),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                children: [
                   Container(
               alignment: Alignment.bottomLeft,
               child: Text(
                textAlign: TextAlign.start,
                'ID destinataire',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 20,
                ),
               ),
             ),
             SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius:  BorderRadius.circular(15),
                border: Border.all(
                  color: kWhite
                )
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'exp: JD2M0778898G' ,
                  hintStyle: TextStyle(
                    color: kWhite,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
               ),
            ),
            SizedBox(height: 20,),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                 'Montant', 
                 style: TextStyle(
                   color: kWhite,
                   fontSize: 20,
                 ),
                           ),
              ),
             SizedBox(height: 10,),
                     Row(
            children: [
                Expanded(
                   child: Container(
                     decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(10),
                      border: Border.all(
                        color: kWhite
                      )
                    ),
                     child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              suffixIcon: MyText(txt: 'USD', color: kWhite, size: 25),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                   ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                           decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(15),
                              border: Border.all(
                                color: kWhite
                              )
                            ),
                          child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                             suffixIcon: MyText(txt: 'BTC', color: kWhite, size: 25),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              
                            ),
                          ),
                        ),
                      ),
              ],
             ),
             SizedBox(
              height: 25,
             ),
               TextButton(
                   onPressed: (){
                    setState(() {
                      addTransaction();
                    });
                   }, 
                  child: MyText(txt: 'Envoyer', size: 20, color: kWhite),
                  style:TextButton.styleFrom(
                   backgroundColor: kRose,
                   minimumSize: Size(150, 50),
                   ),
                ),
                ],
              ),
            )
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