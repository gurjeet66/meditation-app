import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  Usermodel({
    required this.password,
    required this.name,
    required this.email,
    required this .profileImageUrl,
  });
  late final String password;
  late final String name;
  late final String email;
  late final String profileImageUrl;
  
  Usermodel.fromJson(Map<String, dynamic> json){
    password = json['password']??" ";
    name = json['name']??" ";
    email = json['email']??" ";
    profileImageUrl= json["profileImageUrl"]?? "";
  }

    Map<String, dynamic> toJson() {
    return {
      'password': password,
      'name': name,
      'email': email,
      'profileImageUrl':profileImageUrl,
      
    };
  }
  factory Usermodel.fromDocument(DocumentSnapshot doc) {
    return Usermodel(
      name: doc['username'],
      email: doc['email'], password: doc["password"], profileImageUrl: doc["profileImageUrl"],
    );
  }
}