import 'package:hive/hive.dart';

part "user_model.g.dart";

enum UserType { talent, seeker, academy }

@HiveType(typeId: 2)
class UserData extends HiveObject{

  @HiveType(typeId: 0)
  String name = "";

  @HiveType(typeId: 1)
  int age = 0;

  @HiveType(typeId: 2)
  UserType userType = UserType.talent;

  @HiveType(typeId: 3)
  String phoneNumber = "";

  @HiveType(typeId: 4)
  String email = "";
  //Object picture;
}
