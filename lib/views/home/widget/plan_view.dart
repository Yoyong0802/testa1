import 'package:c1786/views/home/widget/plan_view_app_bar.dart';
import 'package:flutter/material.dart';


class PlanView extends StatefulWidget {
  const PlanView({super.key});

  @override
  State<PlanView> createState() => _PlanViewState();
}

class _PlanViewState extends State<PlanView>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      appBar: PlanViewAppBar(),
    );
  }
}

