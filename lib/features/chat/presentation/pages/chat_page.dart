import 'package:chat_gpt/core/strings/app_strings.dart';
import 'package:chat_gpt/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/send_msg_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: const ChatAppBarWidget(),
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is EmptyChatState) {
                  return Center(
                    child: Text(
                      AppStrings.emptyChatMessage,
                      style: TextStyle(
                          color: Theme
                              .of(context)
                              .disabledColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppStrings.fontFamily
                      ),
                    ),
                  );
                } else {
                return const SizedBox();
                }
              },
            ),
          ),
          SendMSGWidget()
        ],
      ),
    );
  }
}
