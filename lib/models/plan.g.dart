part of 'plan.dart';

class PlanAdapter extends TypeAdapter<Plan>{
  @override
  final int typeId  = 0;

  @override
  Plan read(BinaryReader reader){
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for(int i = 0; i <numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Plan(
      id: fields[0],
      name: fields[1] as String,
      location: fields[2] as String,
      CreateaDate: fields[3] as DateTime,
      parkingAvailable: fields[4] as String,
      lengthofhike: fields[5] as String,
      levelofDifficulty: fields[6] as String,
      Description: fields[7] as String,
      customField: fields[8] as String,);
  }

  @override
  void write(BinaryWriter writer, Plan obj){
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.CreateaDate)
      ..writeByte(4)
      ..write(obj.parkingAvailble)
      ..writeByte(5)
      ..write(obj.lengthofhike)
      ..writeByte(6)
      ..write(obj.levelofDifficulty)
      ..writeByte(7)
      ..write(obj.Description)
      ..writeByte(8)
      ..write(obj.customField);

  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
      other is PlanAdapter &&
          other.runtimeType == other.runtimeType &&
          typeId == other.typeId;
}