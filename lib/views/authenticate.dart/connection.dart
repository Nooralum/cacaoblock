import 'package:cacaoblock/constants.dart';
import 'package:cacaoblock/views/Accueil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'inscription.dart';

class Connection extends StatefulWidget {
  static const String id = 'connection';
  const Connection({super.key});

  @override
  State<Connection> createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>() ;

  String? _email = '';
  String? _password = '';

  Future<void> enregistrement() async{
    final formState = _formKey.currentState;
    if ((formState!.validate()?? false)) {
      formState.save();
      try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: _email!, password: _password!);
      Navigator.pushNamed(context, HomeScreen.id);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/back.jpg'),
            fit: BoxFit.cover
            ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty)  {
                      return 'Entrer un email Svp';
                    } else if(!(value.contains('@'))) {
                      return 'email incorrect';
                    } else{
                      return null;
                    }
                  },
                  onSaved: (value) => _email = value,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    helperMaxLines: 30,
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                      
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kWhite,
                        width: 2.0
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15))

                    )
                   
                  ),
                ),
                SizedBox(height: 15,),
              TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if (value!.isEmpty) {
                      return 'Entrer un mot de passe';
                    } else if(value.length < 6){
                      return 'Doit dépasser 6 caractère';
                    } else{
                      return null;
                    }
                  },
                  onSaved: (value) => _password = value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.amber
                    ),
                     hintStyle: TextStyle(
                      color: Colors.white,
                       fontSize: 20,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kWhite,
                        width: 2.0
                      )
                    )
                  ),  
                ),
                SizedBox(height: 20,),
                TextButton(
                  onPressed: () {}, 
                  child: Text(
                    'Mot de passe oublié?',
                    textAlign: TextAlign.end,
                    ),
                  ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: (){
                     setState(() {
                       enregistrement();
                     });
                  }, 
                  child: Text(
                    'Connection',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 154, 0, 101),
                    minimumSize: Size(200, 50)
                  ),
                  ),
                  SizedBox(height: 20,),
                  MesText(txt: 'OU', size: 15, color: kWhite,),
                  SizedBox(height: 20,),
                 ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RegisterPage.id);
                  }, 
                  child: Text(
                    'Inscription',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 154, 0, 101),
                    minimumSize: Size(200, 50)
                  ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MesText extends StatelessWidget {
  const MesText({
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