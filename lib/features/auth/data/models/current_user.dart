

class CurrentUser{
  final String uid;
  final String email;
  final String name;
  final String phoneNumber;
 
 CurrentUser({required this.uid,required this.email,required this.name,required this.phoneNumber});

 factory CurrentUser.fromJson(Map<String, dynamic> map) => CurrentUser(
  uid: map['uid'],
   email: map['email'],
    name: map['name'],
     phoneNumber: map['phoneNumber']
     );

}