import 'package:cacaoblock/constants.dart';
import 'package:cacaoblock/views/transaction/transac.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  static const String id = 'Accueil';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
      backgroundColor: Color.fromARGB(255, 0, 23, 73),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.account_circle),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    'Hello ${take.toString()}',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                    ),
                    )
                ],
               
              ),
              SizedBox(height: 3,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                elevation: 4,
                color: Color.fromARGB(255, 37, 42, 73),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(txt: 'Balance', size: 20, color: kWhite,),
                           Row(
                            children: [
                              MyText(txt:'2233 USD' , color: kWhite, size: 30),
                              SizedBox(width: 150,),
                              Text(
                                '+2.34%',
                                 style: TextStyle(
                                   fontSize: 17,
                                   color: Color.fromARGB(255, 18, 210, 2),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                            onPressed: null, 
                            child: Row(
                              children: [
                                MyText(txt: 'Envoyer', size: 20, color: kWhite),
                                SizedBox(width: 10,),
                                Icon(Icons.arrow_outward, size: 30,)
                              ],
                            ),
                            style:TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 154, 0, 101),
                            ),
                          ),
      
      
                          TextButton(
                            onPressed: null, 
                            child: Row(
                              children: [
                                MyText(txt: 'Recevoir', color: kWhite, size: 20),
                                SizedBox(width: 10,),
                                Icon(Icons.arrow_outward, size: 30,)
                              ],
                            ),
                            style:TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 154, 0, 101),
                            ),
                            
                          ),
                           ],
                         )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 37, 42, 73),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: kWhite,),
                  hintText: 'Recherche',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: kWhite,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
              ),
              ),
             Expanded(
               child: SingleChildScrollView(
                 child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index){
                    return ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.money),
                    ),
                    title: Text(
                      'Ethereum',
                      style: TextStyle(
                         fontSize: 19,
                         color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'ETH',
                      style: TextStyle(
                         fontSize: 15,
                         color: Colors.white,
                         fontStyle: FontStyle.italic
                      ),
                      ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '211877 USD',
                          style: TextStyle(
                             fontSize: 17,
                             color: Colors.white,
                          ),
                          ),
                        Text(
                          '+ 1.23%',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 18, 210, 2),
                          ),
                        ),
                        
                      ],
                    ),
                  );
                  }
                  ),
                 ),
               ),
             ),
          
            ],
        
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(
        onPressed1: null,
         onPressed2: TransactionPage.id, 
         onPressed3: null, 
         onPressed4: null
         )
    );
  }
}

class bottomBar extends StatelessWidget {
  const bottomBar({
    super.key, required this.onPressed1, required this.onPressed2, required this.onPressed3, required this.onPressed4,
  });
  final onPressed1;
  final onPressed2;
  final onPressed3;
  final onPressed4;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(19),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 86, 103, 140),
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.only(left: 30, right: 30,),
            onPressed: (){
              Navigator.pushNamed(context, onPressed1);
            }, 
            icon: Icon(Icons.home, size: 40,)
            ),
          IconButton(
            padding: EdgeInsets.only(left: 30, right: 20),
            onPressed: (){
              Navigator.pushNamed(context, onPressed2);
            }, 
            icon: Icon(Icons.attach_money, size: 40,)
            ),
          IconButton(
            padding: EdgeInsets.only(left: 30, right: 40),
            onPressed:  (){
              Navigator.pushNamed(context, onPressed3);
            }, 
            icon: Icon(Icons.analytics, size: 40,),
            ),
          IconButton(
            padding: EdgeInsets.only(left: 10, right: 20),
            onPressed:  (){
              Navigator.pushNamed(context, onPressed4);
            }, 
            icon: Icon(Icons.more_outlined, size: 40,)
            ),
        ],
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key, required this.txt, required this.color, required this.size,
  });
  final String txt;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
       style: TextStyle(
        fontSize: size,
        color: color,
       ),
    );
  }
}