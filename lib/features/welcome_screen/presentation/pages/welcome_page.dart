import 'package:chat_gpt/core/contants/consts.dart';
import 'package:chat_gpt/features/chat/presentation/pages/chat_page.dart';
import 'package:chat_gpt/features/welcome_screen/presentation/bloc/welcome_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/strings/app_strings.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';
import '../widgets/welcome_message_widget.dart';
import '../widgets/welcome_title_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const WelcomeTitleWidget(),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0, size.height * 0.07, 0, size.height * 0.04),
              child: BlocBuilder<WelcomeBloc, WelcomeState>(
                builder: (context, state) {
                  if (state is WelcomeNextState) {
                    return Column(
                      children: [
                        SvgPicture.asset(
                          state.entity.icon,
                          height: 24,
                          width: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            state.entity.title,
                            style: TextStyle(
                                fontFamily: AppStrings.fontFamily,
                                fontSize: 25,
                                color: Theme.of(context).canvasColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              AppConstants.outerPadding,
                              12,
                              AppConstants.outerPadding,
                              12),
                          child: Column(
                            children: [
                              for (int i = 0;
                                  i < state.entity.messages.length;
                                  i++)
                                WelcomeMessageWidget(
                                  message: state.entity.messages[i],
                                )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, size.height * 0.03, 0,
                              AppConstants.outerPadding),
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < 3; i++)
                                  GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<WelcomeBloc>(context)
                                          .add(WelcomeNext(index:i));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12.0, 2, 12, 2),
                                      child: Container(
                                        height: 2,
                                        width: 30,
                                        color: i == state.index - 1
                                            ? Theme.of(context)
                                                .secondaryHeaderColor
                                            : Theme.of(context).highlightColor,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.9,
                          height: size.height * 0.05,
                          child: TextButton(
                            onPressed: () {
                              if (state.index == 3) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => const DashboardPage()));
                                return;
                              }
                              BlocProvider.of<WelcomeBloc>(context)
                                  .add(WelcomeNext(index: state.index));
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).secondaryHeaderColor)),
                            child: state.index == 3
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Let’s Chat",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppStrings.fontFamily,
                                          fontSize: 20,
                                          color: Theme.of(context).canvasColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8.0, 0, 8, 0),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Theme.of(context).canvasColor,
                                        ),
                                      )
                                    ],
                                  )
                                : Text(
                                    "Next",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AppStrings.fontFamily,
                                      fontSize: 20,
                                      color: Theme.of(context).canvasColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
