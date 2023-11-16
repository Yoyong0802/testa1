import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:c1786/models/plan.dart';

class HiveDateStore{
  static const boxName = 'planBox';

  final Box<Plan> box = Hive.box<Plan>(boxName);

  Future<void> addPlan({required Plan plan}) async {
    await box.put(plan.id, plan);
  }

  Future<Plan?> getPlan({required String id}) async{
    return box.get(id);
  }

  //Update

  Future<void> updatePlan({required Plan plan}) async{
    await plan.save();
  }

  Future<void> deletePlan({required Plan plan}) async {
    await plan.delete();
  }

  ValueListenable<Box<Plan>> listenToPlan() => box.listenable();
}