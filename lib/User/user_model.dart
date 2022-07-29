import 'package:hive/hive.dart';

part "user_model.g.dart";

enum UserType { talent, seeker, academy }

@HiveType(typeId: 2)
class UserData extends HiveObject {
  @HiveType(typeId: 0)
  String uID = "";

  @HiveType(typeId: 1)
  String name = "";

  @HiveType(typeId: 2)
  DateTime birthday = DateTime.now();

  @HiveType(typeId: 3)
  UserType userType = UserType.talent;

  @HiveType(typeId: 4)
  String phoneNumber = "";

  @HiveType(typeId: 5)
  String email = "";

  @HiveType(typeId: 6)
  String country = "";
  //Object picture;
}
