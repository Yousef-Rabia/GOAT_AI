import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goat_ai/modules/chat_screen/cubit/states.dart';
import 'package:goat_ai/shared/network/remote/palm_api.dart';
import '../../../shared/widget/chatMessage.dart';

class ChatCubit extends Cubit<ChatStates> {

  ChatCubit() : super(AppInitialState());

  TextEditingController descriptionController =TextEditingController();
  final ChatBotWithPaLM _chatBotWithPaLM = ChatBotWithPaLM();
  final List<ChatMessage> messages = [];

  static ChatCubit get(context) => BlocProvider.of(context);

  Future<void> sendMessage(String txt) async {
    emit(LoadingResponse());
    descriptionController.clear();
    messages.add(ChatMessage(text: txt, sender: 'user'));
    await _chatBotWithPaLM.sendMessage(txt).then((value) {
      if(!(value["error"]==null)) {
        emit(GetResponseError());
      }
      else{
        {
          messages.add(ChatMessage(text: value["response"], sender: 'Bot',));
          emit(GetResponseCorrectly());
        }
      }
    });

  }
}
