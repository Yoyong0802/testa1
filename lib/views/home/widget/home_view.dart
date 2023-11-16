import 'package:c1786/extenstions/space_exs.dart';
import 'package:c1786/utils/app_colors.dart';
import 'package:c1786/utils/constansts.dart';
import 'package:c1786/views/home/component/home_app_bar.dart';
import 'package:c1786/views/home/component/slider_drawer.dart';
import 'package:c1786/views/home/widget/hk_form.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:c1786/views/home/component/fab.dart';
import '../../../utils/app_str.dart';
import 'PlanWidget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';



class HomeView extends StatefulWidget {
  const HomeView({Key? key}): super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();

  List<int> testing = [];
  void updateData(List<int> newData){
    setState(() {
      testing = newData;
    });
  }


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: Fab(
        onDataSubmitted: (newData) {
          // Xử lý dữ liệu khi được gửi từ Hike
        },
      ),

      body: SliderDrawer(
        key: drawerKey,
        isDraggable: false,
        animationDuration: 1000,

          slider: CustomDrawer(
            testingData: testing
          ),

          appBar: HomeAppBar(
            drawerKey: drawerKey,
          ),
          child: _buildHomeBody(textTheme)),
    );
  }

  SizedBox _buildHomeBody(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          //app bar custom
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    value: 1/3,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(
                      AppColors.primaryColor,
                    ),
                  ),
                ),
                // Top lv plan
                25.w,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStr.mainTitle,
                      style: textTheme.displayLarge,
                    ),
                    3.h,
                    Text(
                      "1 of 3 plan",
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ) ,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(
              thickness: 2,
              indent: 100,
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 745,
            child: (testing.isNotEmpty && testing !=null)? ListView.builder(
                itemCount: testing.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Dismissible(
                      direction: DismissDirection.horizontal,
                      onDismissed: (_) {
  setState(() {
    testing.clear();
  });
                      },
                      background: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.delete_outline,
                            color: Colors.grey,
                          ),
                          8.w,
                          const Text(
                            AppStr.deletePlan,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      key: Key(index.toString()) ,
                      child: const PlanWidget());
                }): Column(
              children: [
                FadeIn(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Lottie.asset(
                      lottieURL,
                      animate: (testing.isNotEmpty && testing !=null) ? false : true,
                    ),
                  ),
                ),
                FadeInUp(
                  from: 30,
                  child: const Text(
                    AppStr.doneAllPlan,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Show HikeForm and wait for it to complete
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HikeForm(
                          onDataSubmitted: (newData) {
                            // This callback will be called when HikeForm submits data
                            updateData(newData);
                          },
                        ),
                      ),
                    );
                  },
                  child: Text('Open HikeForm'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}





