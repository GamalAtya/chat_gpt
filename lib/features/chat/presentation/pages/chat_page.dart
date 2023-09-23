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
                } else if(state is LoadingChatState){
                  return SingleChildScrollView(
                    reverse: true,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          for(int i =0 ; i < state.messages.length ; i++)
                            state.messages[i].role == 'user' ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child:Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    state.messages[i].content,
                                    style: TextStyle(
                                        color: Theme
                                            .of(context)
                                            .canvasColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppStrings.fontFamily
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ) : state.messages[i].role == 'loading' ?Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).disabledColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child:Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        for(int i = 0 ; i < 3; i++)
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ) : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).disabledColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child:Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      state.messages[i].content,
                                      style: TextStyle(
                                          color: Theme
                                              .of(context)
                                              .canvasColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: AppStrings.fontFamily
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
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
