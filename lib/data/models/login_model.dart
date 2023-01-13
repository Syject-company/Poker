import 'package:flutter/foundation.dart';

class LogInModel {
  String email;
  String password;

  LogInModel({
    @required this.email,
    @required this.password,
  });

  LogInModel copyWith({
    String email,
    String password,
  }) {
    return new LogInModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'LogInModel{email: $email, password: $password}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogInModel &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password);

  @override
  int get hashCode => email.hashCode ^ password.hashCode;

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return new LogInModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'email': this.email,
      'password': this.password,
    } as Map<String, dynamic>;
  }
}
