import 'package:chat_gpt/core/contants/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/strings/app_strings.dart';
import '../widgets/dashboard_app_bar_widget.dart';
import '../widgets/dashboard_button_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const DashboardAppBarWidget(),
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: size.height * 0.45,
            width: size.width,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Theme.of(context).highlightColor, width: 2))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  AppConstants.outerPadding, 12, AppConstants.outerPadding, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DashboardButtonWidget(
                    onPressed: () {},
                    title: "Clear conversations",
                    textColor: Theme.of(context).canvasColor,
                    icon: AppStrings.deleteIcon,
                  ),
                  DashboardButtonWidget(
                    onPressed: () {},
                    title: "Upgrade to Plus",
                    textColor: Theme.of(context).canvasColor,
                    icon: AppStrings.upgradeIcon,
                  ),
                  DashboardButtonWidget(
                    onPressed: () {},
                    title: "Light mode",
                    textColor: Theme.of(context).canvasColor,
                    icon: AppStrings.welcomeIcon1,
                  ),
                  DashboardButtonWidget(
                    onPressed: () {},
                    title: "Updates & FAQ",
                    textColor: Theme.of(context).canvasColor,
                    icon: AppStrings.updatesIcon,
                  ),
                  DashboardButtonWidget(
                    onPressed: () {},
                    title: "Logout",
                    textColor: const Color(0xFFED8C8C),
                    icon: AppStrings.logoutIcon,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
