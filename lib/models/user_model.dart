import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String fName;
  final String lName;
  final String email;
  final String uid;

  UserModel({
    required this.fName,
    required this.lName,
    required this.email,
    required this.uid,
  });

  UserModel copyWith({
    String? fName,
    String? lName,
    String? email,
    String? uid,
  }) {
    return UserModel(
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      email: email ?? this.email,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fName': fName,
      'lName': lName,
      'email': email,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fName: map['fName'] ?? '',
      lName: map['lName'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  factory UserModel.fromDoc(DocumentSnapshot ds) {
    final Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
    return UserModel(
      fName: map['fName'] ?? '',
      lName: map['lName'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(fName: $fName, lName: $lName, email: $email, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.fName == fName &&
        other.lName == lName &&
        other.email == email &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return fName.hashCode ^ lName.hashCode ^ email.hashCode ^ uid.hashCode;
  }
}
