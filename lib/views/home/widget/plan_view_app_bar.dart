import 'package:flutter/material.dart';

class PlanViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlanViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
                child: Icon(Icons.arrow_back_ios_new_rounded)),
          ),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(150);
}
