import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{ 
String uid;
String email;
String name;
String phoneNumber;
String password ; 
String image ; 

UserModel({required this.uid, required this.email, required this.name, required this.phoneNumber , required this.password,required this.image});

Map<String, dynamic> toJson() => {
  'uid': uid,
  'email': email,
  'name': name,
  'phone': phoneNumber,
  'image':image
};

factory UserModel.fromSnapShots(DocumentSnapshot<Map<String, dynamic>> document) {
  Map<String, dynamic> data = document.data()!;
   return UserModel(
  uid: data['uid'],
  email: data['email'],
  name: data['name'],
  phoneNumber: data['phone'],
  password: data['password'],
  image: data['image']
);
}
}
