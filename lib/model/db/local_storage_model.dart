import 'package:hive_flutter/adapters.dart';

part 'local_storage_model.g.dart';

@HiveType(typeId: 0)
class LocalStore {
  @HiveField(0)
   String location;
  @HiveField(1)
   String description;
  @HiveField(2)
   double temp;
  @HiveField(3)
   double feelsLike;
  @HiveField(4)
   int pressure;
  @HiveField(5)
   int humidity;

  LocalStore({
    required this.location,
    required this.description,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
  });
}
