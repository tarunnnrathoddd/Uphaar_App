import 'package:hive/hive.dart';
part 'repository.g.dart';

@HiveType(typeId:0)
class Repository {
  @HiveField(0)
  late List<Map<String,dynamic>> fireStations;

  @HiveField(1)
  late List<Map<String,dynamic>> hospitals;

  @HiveField(2)
  late List<Map<String,dynamic>> policeStations;

  @HiveField(3)
  late DateTime lastUpdated;

  Repository({
    required this.fireStations,
    required this.hospitals,
    required this.policeStations,
    required this.lastUpdated
  });
}