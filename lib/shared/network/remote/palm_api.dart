import 'package:cloud_firestore/cloud_firestore.dart';

class ChatBotWithPaLM {
  final FirebaseFirestore _firestore;
  ChatBotWithPaLM({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;


  Future<Map<String, dynamic>> sendMessage(String txt) async {
    try {
      final ref = await _firestore.collection("discussions").add({'prompt': txt});

      DocumentSnapshot<Map<String, dynamic>> docSnapshot;

      do {
        docSnapshot = await ref.get();
        if(docSnapshot.data()!["status"]!= null &&docSnapshot.data()!["status"]["state"] == "ERRORED" )
          {
            return {"response": "Sorry I can't answer" };
          }

      } while (!docSnapshot.data()!.containsKey("response")  );
      return docSnapshot.data()!;
    } catch (e) {
      // Handle any errors that may occur during the process
      print("Error sending message: $e");
      return {"error": e }; // Return an empty map if an error occurs
    }
  }
}
