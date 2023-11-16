import 'package:c1786/models/plan.dart';
import 'package:c1786/views/home/widget/home_view.dart';
import 'package:c1786/views/home/widget/plan_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:c1786/data/hive_dart_store.dart';


Future<void> main() async{

  //init live database
  await Hive.initFlutter();

  Hive.registerAdapter<Plan>(PlanAdapter());

  var box = await Hive.openBox<Plan>(HiveDateStore.boxName);

  box.values.forEach(
          (plan) {
            if (plan.CreateaDate.day != DateTime.now().day) {
              plan.delete();
            }else{
              //do nothing
            }
    });

  runApp(MyApp());
}

class BaseWidget extends InheritedWidget{
  BaseWidget({
    Key? key, required this.child}): super(key:key, child: child);
  final HiveDateStore dateStore = HiveDateStore();
  final Widget child;

  static BaseWidget of(BuildContext context){
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if(base!=null) {
      return base;
    }else{
      throw StateError('Error');
    }
  }

  @override
  bool updateShoudNotify(covariant InheritedWidget oldWidget){
    return false;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hike Details',
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
          displaySmall: TextStyle(
            color: Color.fromARGB(255, 234, 234, 234),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
          headlineSmall: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          titleSmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      // home: HomeView(),
      home: HomeView(),
    );
  }
}



