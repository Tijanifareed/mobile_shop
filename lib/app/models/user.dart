import 'dart:ffi';

class User{
  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String emailAddress;
  String profileImageUrl;
  String homeAddress;
  String password;


  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.emailAddress,
    required this.profileImageUrl,
    required this.homeAddress,
    required this.password,
  });

  Map<String, dynamic> toMap(){
    return{
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "emailAddress": emailAddress,
      "profileImageUrl": profileImageUrl,
      "homeAddress": homeAddress,
      "password": password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map){
    return User(
      id: map["id"] ?? "",
      firstName: map["firstName"] ?? "",
      lastName: map["lastName"] ?? "",
        phoneNumber: map["phoneNumber"] ?? "",
        emailAddress: map["emailAddress"] ?? "",
        profileImageUrl: map["profileImageUrl"] ?? "",
      homeAddress: map["homeAddress"] ?? "",
      password: map["password"],
    );
  }

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? emailAddress,
    String? profileImageUrl,
    String? homeAddress,
    String? password,
}){
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      homeAddress: homeAddress ?? this.homeAddress,
      password: password ?? this.password,
    );
  }








}