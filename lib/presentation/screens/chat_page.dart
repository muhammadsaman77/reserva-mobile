import 'package:booking_app/bloc/chat/chat_bloc.dart';
import 'package:booking_app/data/model/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
    );
  }
}

// class _MessageInput extends StatelessWidget {
//   final String chatId;
//
//   _MessageInput({required this.chatId});
//
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _controller = TextEditingController();
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(hintText: "Type a message"),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               final message = ChatMessage(
//                 id: "",
//                 senderId: "user123", // Ganti dengan ID user Anda
//                 text: _controller.text,
//                 timestamp: DateTime.now(),
//               );
//               context.read<ChatBloc>().add(SendMessage(message));
//               _controller.clear();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
