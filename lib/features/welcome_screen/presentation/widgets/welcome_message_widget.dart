

import 'package:flutter/material.dart';

import '../../../../core/contants/consts.dart';
import '../../../../core/strings/app_strings.dart';

class WelcomeMessageWidget extends StatelessWidget {
  const WelcomeMessageWidget({Key? key , required this.message}) : super(key: key);
  final String message ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0 , 12 , 0 ,12 ),
      child: Container(
        height: size.height * 0.08 ,
        width: size.width * 0.9,
        decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(10)
        ),
        // constraints: BoxConstraints(
        //     minWidth: size.width * 0.9,
        //     minHeight: size.height * 0.07
        // ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(AppConstants.outerPadding , 12 , AppConstants.outerPadding ,12 ),
          child: Text(
            message,
            textAlign:TextAlign.center ,
            style: TextStyle(
              fontFamily: AppStrings.fontFamily,
              fontSize: 20,
              color: Theme.of(context).canvasColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
