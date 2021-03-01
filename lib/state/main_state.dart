import 'package:equatable/equatable.dart';
import 'package:first_game/enum/running.dart';

import '../model/character.dart';

abstract class MainState {
  const MainState();

}


class GameState extends MainState {
  const GameState(this.character);

  final Character character;
}

class LoadingState extends MainState {
  const LoadingState();
}

class InitialState extends MainState {
  const InitialState(this.character);
  final Character character;
}
