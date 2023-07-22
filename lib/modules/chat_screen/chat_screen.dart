import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Column(
          children: [
            if (ChatCubit.get(context).messages.isEmpty)
              const Text("Welcome to GOAT AI" ,style: TextStyle(color: Colors.blue , fontSize: 22 , fontWeight: FontWeight.bold),),
            Flexible(
                child: ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: ChatCubit.get(context).messages.length,
              itemBuilder: (context, index) {
                return ChatCubit.get(context).messages[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 4.0,
                );
              },
            )),
            const Divider(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors
                                .blue, // Change the border color as desired
                            width: 2, // Change the border width as desired
                          ),
                        ),
                        child: TextField(
                          controller:
                              ChatCubit.get(context).descriptionController,
                          decoration: const InputDecoration.collapsed(
                              hintText: "Question/description"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color:
                              Colors.blue, // Change the border color as desired
                          width: 2, // Change the border width as desired
                        ),
                      ),
                      child: state is LoadingResponse? RefreshProgressIndicator(): IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          if (!(ChatCubit.get(context)
                                  .descriptionController
                                  .text ==
                              "")) {
                            ChatCubit.get(context).sendMessage(
                                ChatCubit.get(context)
                                    .descriptionController
                                    .text);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
