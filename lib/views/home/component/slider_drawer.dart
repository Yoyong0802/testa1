import 'package:c1786/extenstions/space_exs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:c1786/utils/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'dart:developer';


class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key, required this.testingData}) : super(key: key);

  final List<int> testingData;

  final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
  ];

  final List<String> texts = [
    "Home",
    "Profile",
    "Setting",
    "Details",
  ];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryGradientColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
        radius: 50,
          backgroundImage: NetworkImage(
            "https://cdn1.iconfinder.com/data/icons/professional-avatars-4/64/programmer-programming-developer-designer-avatar-512.png",
          ),
          ),
          8.h,
          Text(
            "Yong",
            style: textTheme.displayMedium
          ),
          Text(
            "DEV",
            style: textTheme.displaySmall
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 10,
            ),
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: icons.length,
                itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    log('${texts[index]} Item Tappted!');
                  },
                  child: Container(
                    child: ListTile(
                      leading: Icon(icons[index],
                      color: Colors.white,
                      size: 30,
                      ),
                      title: Text(
                          texts[index],
                          style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
                },
            ),
            ),
        ],
      ),
    );
  }
}
