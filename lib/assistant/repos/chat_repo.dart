import 'dart:developer';

// import 'package:chatapp_gemini_api/models/chat_message_model.dart';
// import 'package:chatapp_gemini_api/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:netflix_clone/assistant/models/chat_message_model.dart';
import 'package:netflix_clone/common/utils.dart';

class ChatRepo {
  static Future<String> chatTextGenerationRepo(
      List<ChatMessageModel> previousMessage) async {
    try {
      Dio dio = Dio();

      final response = await dio.post(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=${apiKeyAssistant}",
          data: {
            "contents": previousMessage.map((e) => e.toMap()).toList(),
            "generationConfig": {
              "temperature": 0.9,
              "topK": 1,
              "topP": 1,
              "maxOutputTokens": 2048,
              "stopSequences": []
            },
            "safetySettings": [
              {
                "category": "HARM_CATEGORY_HARASSMENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_HATE_SPEECH",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              },
              {
                "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
                "threshold": "BLOCK_MEDIUM_AND_ABOVE"
              }
            ]
          });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response
            .data['candidates'].first['content']['parts'].first['text'];
      }
      return '';
      // log(response.toString());
    } catch (e) {
      log(e.toString());
      return '';
    }
  }
}
