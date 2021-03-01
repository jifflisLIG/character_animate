import 'dart:async';

import '../enum/direction.dart';
import '../event/main_event.dart';
import '../model/character.dart';
import '../state/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({this.character}) : super(GameState(character));

  Character character;

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is InitializeEvent) {
      yield InitialState(character);
    }
    else if (event is GameEvent) {
      yield GameState(event.character);
    }
  }


  void runCharacter(Direction direction){
    character.run(direction,(){
      add(GameEvent(character.copyWith()));
    });
  }

  void setRunningStatus(bool flag){
   character.isRunning = flag;
  }

  void setDownStatus(bool flag){
    character.isDown = flag;
    add(GameEvent(character.copyWith()));
  }

  void jumpCharacter() {
    character.jump((){
      add(GameEvent(character.copyWith()));
    });
  }
}
