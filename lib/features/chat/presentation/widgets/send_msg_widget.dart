


import 'package:chat_gpt/features/chat/domain/entities/message.dart';
import 'package:chat_gpt/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/strings/app_strings.dart';

class SendMSGWidget extends StatelessWidget {
   SendMSGWidget({Key? key}) : super(key: key);
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return SizedBox(
      height: size.height * 0.13,
      child: Padding(
        padding:  EdgeInsets.fromLTRB(25, 1, 25, size.height * 0.06),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              border: Border.all(color: Theme.of(context).canvasColor , width: 0.1),
              borderRadius: BorderRadius.circular(8)
          ),
          height: size.height * 0.064,
          child: Row(
            children: [
              SizedBox(
                height: size.height * 0.064,
                width: size.width * 0.88,
                child: TextFormField(
                  controller: messageController,
                  cursorColor: Theme
                      .of(context)
                      .canvasColor ,
                  style: TextStyle(
                      color: Theme
                          .of(context)
                          .canvasColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppStrings.fontFamily
                  ),
                  decoration:  InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      suffixIcon: GestureDetector(
                        onTap: (){
                           BlocProvider.of<ChatBloc>(context).add(SendChatEvent(messages: [Message(role: 'user', content: messageController.text)]));
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5 , 0 , 0),
                          child: Container(
                            width: 36,
                            height: 25,
                            decoration: BoxDecoration(
                                color: Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: SvgPicture.asset(AppStrings.sendIcon),
                            ),
                          ),
                        ),
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
