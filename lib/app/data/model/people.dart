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

  @ColumnInfo(name: 'image_url')
  String imageUrl;

  @ColumnInfo(name: 'initial', nullable: true)
  String initial;

  @ColumnInfo(name: 'full_name', nullable: true)
  String fullName;

  @ColumnInfo(name: 'is_updated', nullable: false)
  bool isUpdated = false;

  @ColumnInfo(name: 'connection_status', nullable: false)
  String connectionStatus = "";

  @ColumnInfo(name: 'updated_at', nullable: false)
  int updatedAt = 0;

  @ColumnInfo(name: 'age', nullable: false)
  int age;

  @ColumnInfo(name: 'address', nullable: false)
  String address;

  People(
      {this.email,
      this.gender,
      this.phone,
      this.cell,
      this.fullName,
      this.initial,
      this.imageUrl,
      this.isUpdated,
      this.updatedAt,
      this.connectionStatus,
      this.age, this.address});

  People.fromJson(Map<String, dynamic> json) {
    this.email = json['email'];
    this.gender = json['gender'];
    this.phone = json['phone'];
    this.cell = json['cell'];
    this.age = Dob.fromJson(json['dob']).age;
    this.imageUrl = Picture.fromJson(json['picture']).large;

    var nameObj = Name.fromJson(json['name']);
    this.fullName = '${nameObj.first} ${nameObj.last}';
    this.initial = nameObj.title;

    final location = Location.fromJson(json['location']);
    this.address = '${location.city}, ${location.state}, ${location.country}';
  }

  @override
  String toString() {
    return 'Email : $email, FullName : $initial $fullName, Address: $address';
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

  @override
  String toString() {
    // TODO: implement toString
    return 'Initial : $title, First : $first, Last :  $last';
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
