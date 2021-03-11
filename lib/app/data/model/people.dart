import 'dart:core';

import 'package:floor/floor.dart';

@Entity(tableName: 'people')
class People {
  @PrimaryKey(autoGenerate: false)
  @ColumnInfo(name: 'email')
  String email;

  @ColumnInfo(name: 'gender')
  String gender;
  
  @ColumnInfo(name: 'phone')
  String phone;
  
  @ColumnInfo(name: 'cell')
  String cell;

  @ignore
  Name name;

  @ignore
  Dob dob;

  @ignore
  Picture picture;

  @ignore
  Location location;

  @ignore
  Connection connection;

  People({this.email, this.gender, this.phone, this.cell});

  People.fromJson(Map<String, dynamic> json) {
    this.email = json['email'];
    this.gender = json['gender'];
    this.phone = json['phone'];
    this.cell = json['cell'];
    this.name = Name.fromJson(json['name']);
    this.dob = Dob.fromJson(json['dob']);
    this.picture = Picture.fromJson(json['picture']);
    this.location = Location.fromJson(json['location']);
  }
}

class Name {
  String first;
  String title;
  String last;

  Name.fromJson(Map<String, dynamic> json) {
    this.first = json['first'];
    this.title = json['title'];
    this.last = json['last'];
  }
}

class Dob {
  String date;
  int age;

  Dob.fromJson(Map<String, dynamic> json) {
    this.date = json['date'];
    this.age = json['age'] as int;
  }
}

class Picture {
  String large;
  String medium;
  String thumbnaill;

  Picture.fromJson(Map<String, dynamic> json) {
    this.large = json['large'];
    this.medium = json['medium'];
    this.thumbnaill = json['thumbnaill'];
  }
}

class Location {
  String city;
  String state;
  String country;

  Location.fromJson(Map<String, dynamic> json) {
    this.city = json['city'];
    this.state = json['state'];
    this.country = json['country'];
  }
}

class Connection {
  bool isUpdated;
  String connectionStatus;
  int updatedAt;

  Connection.fromJson(Map<String, dynamic> json) {
    this.isUpdated = json['isUpdated'];
    this.connectionStatus = json['connectionStatus'];
    this.updatedAt = json['updatedAt'];
  }
}
