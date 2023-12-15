import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId:1)
class User {
  @HiveField(0)
  final String number;

  @HiveField(1)
  final String token;

  User({
    required this.number,
    required this.token
  });
}