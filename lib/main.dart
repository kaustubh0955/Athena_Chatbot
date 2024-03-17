import 'package:chatbot/cubit/bot_cubit.dart';
import 'package:chatbot/luna.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() {
  Gemini.init(apiKey: 'AIzaSyBzlPvTCBN5rHHBnLBtxw8K5X22lg-fOJc');
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<BotCubit>(create: (_) => BotCubit()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Color.fromARGB(255, 209, 40, 99), // Light pink background color
        child: ChatScreen(),
      ),
    );
  }
}
