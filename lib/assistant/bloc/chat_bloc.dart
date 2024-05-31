// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:chatapp_gemini_api/models/chat_message_model.dart';
// import 'package:chatapp_gemini_api/repos/chat_repo.dart';

// import 'package:meta/meta.dart';

// part 'chat_event.dart';
// part 'chat_state.dart';

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_clone/assistant/models/chat_message_model.dart';
import 'package:netflix_clone/assistant/repos/chat_repo.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSuccessState(messages: [])) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }

  List<ChatMessageModel> messages = [];
  bool generating = false;

  FutureOr<void> chatGenerateNewTextMessageEvent(
      ChatGenerateNewTextMessageEvent event, Emitter<ChatState> emit) async {
    messages.add(ChatMessageModel(
        role: "user", parts: [ChatPartModel(text: event.inputMessage)]));
    emit(ChatSuccessState(messages: messages));
    generating = true;
    String generatedText = await ChatRepo.chatTextGenerationRepo(messages);
    if (generatedText.length > 0) {
      messages.add(ChatMessageModel(
          role: 'model', parts: [ChatPartModel(text: generatedText)]));
      emit(ChatSuccessState(messages: messages));
    }
    generating = false;
  }
}


// class ChatBloc extends Bloc<ChatEvent, ChatBloc> {
//   ChatBloc() : super(ChatSuccessState(messages: [])) {
//     on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
//   }
//   List<ChatMessageModel> messages = [];
//   bool generating = false;

//   FutureOr<void> chatGenerateNewTextMessageEvent(
//       ChatGenerateNewTextMessageEvent event, Emitter<ChatBloc> emit) async {
//     messages.add(ChatMessageModel(
//         role: "user", parts: [ChatPartModel(text: event.inputMessage)]));
//     emit(ChatSuccessState(messages: messages));
//     generating = true;

//     String generatedText = await ChatRepo.chatTextGenerationRepo(messages);

//     if (generatedText.length > 0) {
//       messages.add(ChatMessageModel(
//           role: 'model', parts: [ChatPartModel(text: generatedText)]));
//       emit(ChatSuccessState(messages: messages));
//     }
//     generating = false;
//   }
// }
