import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:logger/logger.dart';

part 'bot_state.dart';

class BotCubit extends Cubit<BotState> {
  BotCubit() : super(BotInitial());

  Dio dio = Dio();
  final gemini = Gemini.instance;

  List<String> questions = [];
  Map<String, String> answers = {};

  Future<void> getAnswer(String text) async {
    emit(BotLoading());
    try {
      final response = await gemini.text(text);
      print('adfasfadsfasdf');

      Logger().d(response);
      Logger().d(response?.content);
      Logger().d(response?.content?.parts);
      Logger().d(response?.content?.parts?.length);
      questions.add(text);
      String answer = '';
      response!.content!.parts!.forEach((element) {
        answer += element.text!;
      });

      answers[text] = answer;
      emit(BotSuccess());
    } catch (e) {
      print(e);
      emit(BotError());
    }
  }
}
