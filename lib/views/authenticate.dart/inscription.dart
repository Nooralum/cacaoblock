import 'package:cacaoblock/views/Accueil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  String? _name = '';
  String? _email = '';
  String? _password = '';
  TextEditingController _controllerPassword = TextEditingController();

   //methode d'inscription

   Future<void> inscription() async{
    //récupérer l'etat actuel de l'inscription
     final formState = _FormKey.currentState;
     if((formState?.validate()?? false)){
      formState?.save();
      try {
        final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: _email!, password: _password!);
        await _firestore.collection('users').doc(userCredential.user!.uid).set({'name': _name, 'email': _email, 'password':_password});
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
          key: _FormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  Container(
              //   child: Icon(Icons.login_rounded, size: 50,),
              //  ),
                 TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(
                  color: Colors.white,
                )
                ),
                validator:(value) => value!.isEmpty? 'Entrez un nom svp': null,
                onSaved:(value) => _name = value!,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                  color: Colors.white,
                )
                ),
                validator: (value) {
                 if (value == null || value.isEmpty) {
                    return 'Entrez une adresse email svp';
                  } else if(!value.contains('@')){
                    return 'entrez une adresse valide';
                  } else {
                    return null;
                  }
                },
                onSaved:(value) => _email = value!,
              ),
      
             SizedBox(height: 10,),
             TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                  color: Colors.white
                )
                ),
                controller: _controllerPassword,
                validator: (value1) => value1!.length < 6 ? 'Doit dépasser 6 charactère': null,
                onSaved: (value) => _password = value,
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  hintStyle: TextStyle(
                  color: Colors.white
                )
                ),
                validator: (value) {
                  // => ( value!.length < 6 || value != _controllerPassword) ? 'Doit dépasser 6 charactère': null,
                  if (value!.length < 6) {
                    return 'Incorrect. Doit dépasser 6 charactère';
                  } else  if(value != _controllerPassword.text){
                    return 'Incorrect';
                  } else{
                    return null;
                  }
                },
                onSaved: (value) => _password = value,
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: (){
                 setState(() {
                    inscription();
                 });
                }, 
                child: Text(
                  'S\'inscrire', 
                  style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 154, 0, 101),
                    minimumSize: Size(200, 50)
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}