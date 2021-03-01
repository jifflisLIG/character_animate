import '../model/character.dart';

abstract class MainEvent {
  const MainEvent();
}


class GameEvent extends MainEvent {
  const GameEvent(this.character);

  final Character character;
}


class InitializeEvent extends MainEvent {}
