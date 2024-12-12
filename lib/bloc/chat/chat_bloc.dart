import 'package:booking_app/data/model/chat_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';


part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String chatId;

  ChatBloc(this.chatId) : super(ChatInitial()) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
  }

  void _onLoadMessages(LoadMessages event, Emitter<ChatState> emit) {
    final messagesStream = _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots();

    messagesStream.listen((snapshot) {
      final messages = snapshot.docs.map((doc) {
        return ChatMessage.fromFirestore(doc);
      }).toList();
      add(MessagesUpdated(messages));
    });
  }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    final message = event.message;
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toFirestore());
  }
}
