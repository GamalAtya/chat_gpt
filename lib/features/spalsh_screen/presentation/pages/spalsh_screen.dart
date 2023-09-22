

import 'dart:async';
import 'package:chat_gpt/core/contants/consts.dart';
import 'package:chat_gpt/core/strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../welcome_screen/presentation/pages/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    final Timer timer = Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const WelcomePage()));
    });
    timer;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;

    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.13,
                width: size.width * 0.28,
                child: SvgPicture.asset(
                    AppStrings.chatGPTIcon),
              ),
              Padding(
                padding: EdgeInsets.all(AppConstants.outerPadding),
                child: Text("ChatGPT" ,
                  style: TextStyle(
                      color: Theme.of(context).canvasColor,
                      fontFamily: AppStrings.fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 40
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
