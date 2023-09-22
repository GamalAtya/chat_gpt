import 'package:chat_gpt/core/colors/colors.dart';
import 'package:chat_gpt/core/contants/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/strings/app_strings.dart';

class ChatAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const ChatAppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppConstants.outerPadding),
      child: Container(
        height: size.height * 0.0788,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: AppColors.white, width: 0.3))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.outerPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                      color: Theme.of(context).canvasColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.innerPadding),
                      child: Text(
                        "Back",
                        style: TextStyle(
                            fontFamily: AppStrings.fontFamily,
                            color: Theme.of(context).canvasColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                  width: size.width * 0.064,
                  height: size.height * 0.078,
                  child: SvgPicture.asset(AppStrings.chatGPTIcon)),
            ],
          ),
        ),
      ),
    );
  }
}
