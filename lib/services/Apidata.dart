import "dart:developer";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebaseseries/model/usermodel.dart";

class ApIs{
  //FOR AUTHENTICATION
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static late Usermodel me ;
  static get User => auth.currentUser!;
  static Future<bool> userExists()async{
    return (await firestore.collection("users").doc(User.uid).get()).exists;
  }
  static Future<void> getselfinfo()async{
    
    return await firestore.collection("users").doc(User.uid).get().then((User) {
      log("data:${User.exists}");
      if(User.exists){

        me = Usermodel.fromJson(User.data()!);
        
      }else{
        createuser().then((value) => getselfinfo());
      }
    
    });
  }
   
   static Future<bool> createuser()async{
    final user = Usermodel( name: User.name.toString(),password:User.uid, email: User.email.toString(), profileImageUrl: '' );
    return await firestore.collection("users").doc(User.uid).set({
        'name': user.name,
      'password': user.password,
      'email': user.email,
    }).then((value){
      log("User created sucessfully");
      return true;
    }).catchError((error){
      log("Failed to create user:$error");
      return false;
    });
  }
  static Future<void>updateUserprofile() async{
    await firestore.collection('users').doc(User.uid).update({"name":me.name,"email":me.email});
  }

}
