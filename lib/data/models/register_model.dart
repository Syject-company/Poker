import 'package:flutter/foundation.dart';

class RegisterModel {
  String email;
  String name;
  String wm_sid;

  RegisterModel({
    @required this.email,
    @required this.name,
    @required this.wm_sid,
  });

  RegisterModel copyWith({
    String email,
    String name,
    String wm_sid,
  }) {
    return new RegisterModel(
      email: email ?? this.email,
      name: name ?? this.name,
      wm_sid: wm_sid ?? this.wm_sid,
    );
  }

  @override
  String toString() {
    return 'RegisterModel{email: $email, name: $name, wm_sid: $wm_sid}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegisterModel &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          name == other.name &&
          wm_sid == other.wm_sid);

  @override
  int get hashCode => email.hashCode ^ name.hashCode ^ wm_sid.hashCode;

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return new RegisterModel(
      email: json['email'] as String,
      name: json['name'] as String,
      wm_sid: json['wm_sid'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'email': this.email,
      'name': this.name,
      'wm_sid': this.wm_sid,
    } as Map<String, dynamic>;
  }
}
