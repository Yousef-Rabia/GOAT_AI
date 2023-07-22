import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    required this.text,
    required this.sender,
  }) : super(key: key);

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(sender=="Bot"?0.3:0),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.blue, // Change the border color as desired
          width: 2, // Change the border width as desired
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sender's initial letter as an avatar
            CircleAvatar(
              backgroundColor: Colors.blue.withOpacity(sender=="Bot"?0:1), // Customize the background color of the avatar
              child:sender=="Bot"?Image.asset('assets/images/logo1.png') : Image.asset('assets/images/user.png'),
            ),
            SizedBox(width: 8), // Add some spacing between the avatar and the message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:  Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(8),
                    child:  Text(text ,style: const TextStyle(fontSize: 15),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
