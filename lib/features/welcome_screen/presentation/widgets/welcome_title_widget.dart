

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/contants/consts.dart';
import '../../../../core/strings/app_strings.dart';

class WelcomeTitleWidget extends StatelessWidget {
  const WelcomeTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(AppConstants.outerPadding,
          size.height * 0.05, AppConstants.outerPadding, 0),
      child: SizedBox(
        height: size.height * 0.27,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.all(AppConstants.outerPadding),
              child: SvgPicture.asset(AppStrings.chatGPTIcon , width: 24 , height: 24,),
            ),
            Text(
              AppStrings.welcomeTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: AppStrings.fontFamily,
                  fontSize: 40,
                  color: Theme.of(context).canvasColor,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding:  EdgeInsets.all(AppConstants.outerPadding),
              child: Text(
                AppStrings.emptyChatMessage,
                style: TextStyle(
                    fontFamily: AppStrings.fontFamily,
                    fontSize: 20,
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
