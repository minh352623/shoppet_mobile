
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';


User userFromJson(String str)=>User.fromJson(json.decode(str));


@HiveType(typeId: 5)
class User {
  @HiveField(0)
  final int id ;

  @HiveField(1)
  final String email ;


  @HiveField(2)
  final String name ;

  @HiveField(3)
  final String avatar ;

  User({required this.id, required this.email,required this.avatar,required this.name});

  factory User.fromJson(Map<String,dynamic> data)=>User(

    id:data['user']['id'],
    email:data['user']['email'],
    name:data['user']['name'],
    avatar:data['user']['image'],


  );
}
