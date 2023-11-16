import 'dart:developer';

import 'package:c1786/views/home/widget/plan_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../widget/hk_form.dart';

class Fab extends StatelessWidget {
  const Fab({
    Key? key,
    required this.onDataSubmitted,
  }) : super(key: key);

  final Function(List<int>) onDataSubmitted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => HikeForm(
              onDataSubmitted: onDataSubmitted,
            ),
          ),
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 10,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
