import 'package:hive_flutter/adapters.dart';

part 'local_storage_model.g.dart';

@HiveType(typeId: 0)
class LocalStore {
  @HiveField(0)
  late String location;
  @HiveField(1)
  late String description;
  @HiveField(2)
  late double temp;
  @HiveField(3)
  late double feelsLike;
  @HiveField(4)
  late int pressure;
  @HiveField(5)
  late int humidity;

  LocalStore({
    required this.location,
    required this.description,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
  });
}
