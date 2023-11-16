import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'plan.g.dart';

@HiveType(typeId: 0)
class Plan extends HiveObject {
  Plan({
    required this.id,
    required this.name,
    required this.location,
    required this.CreateaDate,
    required String parkingAvailable, // Change to 'String parkingAvailable' instead of 'String? parkingAvailable'
    required this.lengthofhike,
    required String levelofDifficulty, // Change to 'String levelofDifficulty' instead of 'String? levelofDifficulty'
    required this.Description,
    required this.customField,
  })   : parkingAvailble = parkingAvailable,
        levelofDifficulty = levelofDifficulty;

  @HiveField(0)
  final String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String location;
  @HiveField(3)
  DateTime CreateaDate;
  @HiveField(4)
  String parkingAvailble;
  @HiveField(5)
  String lengthofhike;
  @HiveField(6)
  String levelofDifficulty;
  @HiveField(7)
  String Description;
  @HiveField(8)
  String customField;

  factory Plan.create({
    required String? name,
    required String? location,
    required String? lengthofhike,
    required String? Description,
    required String? customField,
    DateTime? CreateaDate,
    required String parkingAvailable, // Add 'required' for parkingAvailable
    required String levelofDifficulty, // Add 'required' for levelofDifficulty
  }) =>
      Plan(
        id: const Uuid().v1(),
        name: name ?? "",
        location: location ?? "",
        CreateaDate: CreateaDate ?? DateTime.now(),
        parkingAvailable: parkingAvailable, // Assign the provided value to parkingAvailable
        lengthofhike: lengthofhike ?? "",
        levelofDifficulty: levelofDifficulty, // Assign the provided value to levelofDifficulty
        Description: Description ?? "",
        customField: customField ?? "",
      );
}
