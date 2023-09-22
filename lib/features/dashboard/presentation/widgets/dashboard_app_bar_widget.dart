import 'package:chat_gpt/core/colors/colors.dart';
import 'package:chat_gpt/core/contants/consts.dart';
import 'package:chat_gpt/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/strings/app_strings.dart';

class DashboardAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const DashboardAppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatPage())),
      child: Container(
        color: Theme.of(context).primaryColorDark,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: size.height * 0.08,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColors.white, width: 0.3))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.outerPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: size.width * 0.064,
                          height: size.height * 0.078,
                          child: SvgPicture.asset(AppStrings.chatIcon)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.innerPadding),
                        child: Text(
                          "New Chat",
                          style: TextStyle(
                              fontFamily: AppStrings.fontFamily,
                              color: Theme.of(context).canvasColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Theme.of(context).canvasColor,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
