part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadMessages extends ChatEvent {}

class MessagesUpdated extends ChatEvent {
  final List<ChatMessage> messages;

  MessagesUpdated(this.messages);

  @override
  List<Object?> get props => [messages];
}

class SendMessage extends ChatEvent {
  final ChatMessage message;

  SendMessage(this.message);

  @override
  List<Object?> get props => [message];
}
