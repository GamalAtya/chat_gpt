


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/contants/consts.dart';
import '../../../../core/strings/app_strings.dart';

class DashboardButtonWidget extends StatelessWidget {
  const DashboardButtonWidget({Key? key , required this.icon , required this.title , required this.onPressed , required this.textColor}) : super(key: key);
  final String title ;
  final Color textColor ;
  final String icon ;
  final void Function() onPressed ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SizedBox(
      height: size.height * 0.08,
      width: size.width * 0.9,
      child: TextButton(
        onPressed:onPressed,
        child: Row(
          children: [
            SizedBox(
                width: size.width * 0.064,
                height: size.height * 0.08,
                child: SvgPicture.asset(icon)),
            Padding(
              padding: EdgeInsets.fromLTRB(AppConstants.outerPadding , 12 , AppConstants.outerPadding ,12 ),
              child: Text(
                title,
                textAlign:TextAlign.center ,
                style: TextStyle(
                  fontFamily: AppStrings.fontFamily,
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
