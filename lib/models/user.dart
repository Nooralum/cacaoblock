import 'dart:convert';

Users usersFromMap(String str)=> Users.fromMap(json.decode(str));
String usersToMap(Users data)=> json.encode(data.toMap());

class Users {

   String id;
   String email;
   String name;
   String password;

  Users({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    id: json["id"], 
    email: json["email"],
    name: json["name"], 
    password: json["password"]
    );
  
  Map<String, dynamic> toMap() =>{
    "id": id,
    "email": email,
    "name": name,
    "password": password,
  };

  
}