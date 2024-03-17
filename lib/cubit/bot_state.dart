part of 'bot_cubit.dart';

sealed class BotState {}

final class BotInitial extends BotState {}

final class BotLoading extends BotState {}

final class BotSuccess extends BotState {}

final class BotError extends BotState {}
