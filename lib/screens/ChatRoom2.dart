// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_setup/constants.dart';
// import 'Constants.dart';
// import 'package:flutter/material.dart';
//
// class ChatRoom2 extends StatefulWidget {
//   static String id = "chat_screen";
//
//   const ChatRoom2({Key? key}) : super(key: key);
//
//   @override
//   _ChatRoom2State createState() => _ChatRoom2State();
// }
//
// class _ChatRoom2State extends State<ChatRoom2> {
//   final messageTextController = TextEditingController();
//   final _firestore = FirebaseFirestore.instance;
//   final _auth = FirebaseAuth.instance;
//   late User? loggedInUser;
//   late String messageText;
//
//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }
//
//   void getCurrentUser() async {
//     try {
//       final user = _auth.currentUser;
//       if (user != null) {
//         setState(() {
//           loggedInUser = user;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: null,
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.close),
//             onPressed: () {
//               _auth.signOut();
//               Navigator.pop(context);
//             },
//           ),
//         ],
//         title: const Text('Chat'),
//         backgroundColor: Color.fromRGBO(162, 83, 169, 1.0),
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             StreamBuilder(
//               stream: _firestore
//                   .collection('messages2Datastruct')
//                   .orderBy('createdAt', descending: true)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else {
//                   final message = snapshot.data?.docs;
//                   List<MessageBubble> messages = [];
//                   for (var msg in message!) {
//                     final messageTxt = (msg.data())['text'];
//                     final messageSender = (msg.data())['sender'];
//                     final currentUser = loggedInUser?.email ?? '';
//                     messages.add(MessageBubble(
//                       messageTxt: messageTxt,
//                       messageSender: messageSender,
//                       isMe: currentUser == messageSender,
//                     ));
//                   }
//                   return Expanded(
//                     child: ListView(reverse: true, children: messages),
//                   );
//                 }
//               },
//             ),
//             Container(
//               decoration: kMessageContainerDecoration,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       controller: messageTextController,
//                       onChanged: (value) {
//                         messageText = value;
//                       },
//                       decoration: kMessageTextFieldDecoration,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       messageTextController.clear();
//                       _firestore.collection('messages2Datastruct').add(
//                         {
//                           'text': messageText,
//                           'sender': loggedInUser?.email ?? '',
//                           'createdAt': DateTime.now(),
//                         },
//                       );
//                     },
//                     child: const Text(
//                       'Send',
//                       style: kSendButtonTextStyle,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MessageBubble extends StatelessWidget {
//   final String messageTxt;
//   final String messageSender;
//   final bool isMe;
//
//   const MessageBubble({
//     Key? key,
//     required this.messageTxt,
//     required this.messageSender,
//     required this.isMe,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//       children: [
//         Text(
//           messageSender,
//           style: const TextStyle(color: Colors.black54, fontSize: 12),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Material(
//             elevation: 5.0,
//             borderRadius: BorderRadius.only(
//               topLeft: isMe ? const Radius.circular(30.0) : const Radius.circular(0),
//               bottomLeft: const Radius.circular(30.0),
//               bottomRight: const Radius.circular(30.0),
//               topRight: isMe ? const Radius.circular(0) : const Radius.circular(30),
//             ),
//             color: isMe ? Colors.purple : Colors.purpleAccent,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               child: Text(
//                 messageTxt,
//                 style: const TextStyle(color: Colors.white, fontSize: 20),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//


//ttttttttttttttttttttttttttt

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

class ChatRoom2 extends StatefulWidget {
  static String id = "chat_screen";

  const ChatRoom2({Key? key}) : super(key: key);

  @override
  _ChatRoom2State createState() => _ChatRoom2State();
}

class _ChatRoom2State extends State<ChatRoom2> {
  final messageTextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User? loggedInUser;
  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        setState(() {
          loggedInUser = user;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.close),
          //   onPressed: () {
          //     _auth.signOut();
          //     Navigator.pop(context);
          //   },
          // ),
        ],
        title: const Text(' Doubts Chat'),
        backgroundColor: Color.fromRGBO(162, 83, 169, 1.0),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
              stream: _firestore
                  .collection('messages2Datastruct')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final message = snapshot.data?.docs;
                  List<MessageBubble> messages = [];
                  for (var msg in message!) {
                    final messageTxt = (msg.data())['text'];
                    final messageSender = (msg.data())['sender'];
                    final currentUser = loggedInUser?.email ?? '';
                    messages.add(MessageBubble(
                      messageTxt: messageTxt,
                      messageSender: messageSender,
                      isMe: currentUser == messageSender,
                    ));
                  }
                  return Expanded(
                    child: ListView(reverse: true, children: messages),
                  );
                }
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages2Datastruct').add(
                        {
                          'text': messageText,
                          'sender': loggedInUser?.email ?? '',
                          'createdAt': DateTime.now(),
                        },
                      );
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
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

class MessageBubble extends StatelessWidget {
  final String messageTxt;
  final String messageSender;
  final bool isMe;

  const MessageBubble({
    Key? key,
    required this.messageTxt,
    required this.messageSender,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            messageSender.split('@')[0], // Display username without domain
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.only(
              topLeft: isMe ? const Radius.circular(30.0) : const Radius.circular(0),
              bottomLeft: const Radius.circular(30.0),
              bottomRight: const Radius.circular(30.0),
              topRight: isMe ? const Radius.circular(0) : const Radius.circular(30),
            ),
            color: isMe ? Colors.purple : Colors.purpleAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                messageTxt,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Constants for decoration and styles
const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.grey, width: 0.5),
  ),
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.purple,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
