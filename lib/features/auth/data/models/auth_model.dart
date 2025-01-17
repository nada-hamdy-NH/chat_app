

class UserModel{ 
String uid;
String email;
String name;
String phoneNumber;
String? password ; 
String image ; 

UserModel({required this.uid, required this.email, required this.name, required this.phoneNumber , required this.password,required this.image});

Map<String, dynamic>toJson() => {
  'uid': uid,
  'email': email,
  'name': name,
  'phone': phoneNumber,
  'image':image,
  'password':password
};

factory UserModel.fromSnapShots(Map<String, dynamic> json) {
   return UserModel(
  uid: json['uid']??'',
  email: json['email']??'',
  name: json['name']??'',
  phoneNumber: json['phone']??'',
  password: json['password']??'',
  image: json['image']??'',
);
}
}
