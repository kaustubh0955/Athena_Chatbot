import 'package:chatbot/cubit/bot_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _userMessageController = TextEditingController();

  final gemini = Gemini.instance;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BotCubit, BotState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is BotLoading) {
          return Scaffold(
            body: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Luna'),
          ),
          backgroundColor: const Color.fromARGB(255, 107, 103, 103),
          body: Container(
            color: Color.fromARGB(
                255, 214, 144, 169), // Adjust the shade of pink as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: BlocProvider.of<BotCubit>(context)
                            .questions
                            .map(
                              (e) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Q. ' + e,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'A. ' +
                                        BlocProvider.of<BotCubit>(context)
                                            .answers[e]!,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Divider()
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 15,
                        child: TextFormField(
                          controller: _userMessageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            labelText: "Enter your message",
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        padding: const EdgeInsets.all(15),
                        iconSize: 30,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                            const CircleBorder(),
                          ),
                        ),
                        onPressed: () {
                          BlocProvider.of<BotCubit>(context)
                              .getAnswer(_userMessageController.text);
                        },
                        icon: const Icon(Icons.send),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
