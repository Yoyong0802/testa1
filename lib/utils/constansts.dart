import 'package:c1786/main.dart';
import 'package:c1786/utils/app_str.dart';
import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

String lottieURL = 'assets/lottie/Animation - 1699551769702.json';

dynamic emptyWarning(BuildContext context){
  return FToast.toast(
      context,
      msg: AppStr.oopsMsg,
    subMsg: 'You must fill all Fields',
    corner: 20.0,
    duration: 2000,
    padding: const EdgeInsets.all(20),
  );
}

dynamic updatePlanWarning(BuildContext context){
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: 'You must edit Fields',
    corner: 20.0,
    duration: 5000,
    padding: const EdgeInsets.all(20),
  );
}

noPlanWarning(BuildContext context){
  return PanaraInfoDialog.showAnimatedGrow(
      context,
      title: AppStr.oopsMsg,
      message: "There no Plan delete",
      buttonText: "Ok",
      onTapDismiss: (){
        Navigator.pop(context);
      },
      panaraDialogType: PanaraDialogType.warning,);
}

dynamic deleteALlPlan(BuildContext context){
  return PanaraConfirmDialog.show(
      context,
      title: AppStr.areYouSure,
      message: "Do you want Delete All",
      confirmButtonText: 'Yes',
      cancelButtonText: 'No',
      onTapConfirm: (){
        Navigator.pop(context);
      },
      onTapCancel: (){
        Navigator.pop(context);
      },
      panaraDialogType: PanaraDialogType.error,
    barrierDismissible: false
  );
}