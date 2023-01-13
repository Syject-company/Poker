import 'package:flutter/foundation.dart';

class SignUpModel {
  String trading_platform;
  String currency;
  String first_name;
  String last_name;
  String address;
  String phone_number;
  String zip;
  String city;
  String country;
  String date_of_birth;
  String email;
  String password;
  String wm_sid;

  SignUpModel({
    @required this.trading_platform,
    @required this.currency,
    @required this.first_name,
    @required this.last_name,
    @required this.address,
    @required this.phone_number,
    @required this.zip,
    @required this.city,
    @required this.country,
    @required this.date_of_birth,
    @required this.email,
    @required this.password,
    @required this.wm_sid,
  });

  SignUpModel copyWith({
    String trading_platform,
    String currency,
    String first_name,
    String last_name,
    String address,
    String phone_number,
    String zip,
    String city,
    String country,
    String date_of_birth,
    String email,
    String password,
    String wm_sid,
  }) {
    return new SignUpModel(
      trading_platform: trading_platform ?? this.trading_platform,
      currency: currency ?? this.currency,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      address: address ?? this.address,
      phone_number: phone_number ?? this.phone_number,
      zip: zip ?? this.zip,
      city: city ?? this.city,
      country: country ?? this.country,
      date_of_birth: date_of_birth ?? this.date_of_birth,
      email: email ?? this.email,
      password: password ?? this.password,
      wm_sid: wm_sid ?? this.wm_sid,
    );
  }

  @override
  String toString() {
    return 'SignUpModel{trading_platform: $trading_platform, currency: $currency, first_name: $first_name, last_name: $last_name, address: $address, phone_number: $phone_number, zip: $zip, city: $city, country: $country, date_of_birth: $date_of_birth, email: $email, password: $password, wm_sid: $wm_sid}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignUpModel &&
          runtimeType == other.runtimeType &&
          trading_platform == other.trading_platform &&
          currency == other.currency &&
          first_name == other.first_name &&
          last_name == other.last_name &&
          address == other.address &&
          phone_number == other.phone_number &&
          zip == other.zip &&
          city == other.city &&
          country == other.country &&
          date_of_birth == other.date_of_birth &&
          email == other.email &&
          password == other.password &&
          wm_sid == other.wm_sid);

  @override
  int get hashCode =>
      trading_platform.hashCode ^
      currency.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      address.hashCode ^
      phone_number.hashCode ^
      zip.hashCode ^
      city.hashCode ^
      country.hashCode ^
      date_of_birth.hashCode ^
      email.hashCode ^
      password.hashCode ^
      wm_sid.hashCode;

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return new SignUpModel(
      trading_platform: json['trading_platform'] as String,
      currency: json['currency'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      address: json['address'] as String,
      phone_number: json['phone_number'] as String,
      zip: json['zip'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      date_of_birth: json['date_of_birth'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      wm_sid: json['wm_sid'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'trading_platform': this.trading_platform,
      'currency': this.currency,
      'first_name': this.first_name,
      'last_name': this.last_name,
      'address': this.address,
      'phone_number': this.phone_number,
      'zip': this.zip,
      'city': this.city,
      'country': this.country,
      'date_of_birth': this.date_of_birth,
      'email': this.email,
      'password': this.password,
      'wm_sid': this.wm_sid,
    } as Map<String, dynamic>;
  }
}
