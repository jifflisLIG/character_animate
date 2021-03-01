import 'dart:math';

import 'package:first_game/enum/direction.dart';
import 'package:first_game/model/character.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../enum/running.dart';

class CharacterRunning extends StatelessWidget {
  const CharacterRunning(this.character);
  final Character character;

  @override
  Widget build(BuildContext context) {
    if (character.direction == Direction.left) {
      return Container(
        width: 40,
        height: character.isDown?32:40,
        child: Image.asset(_getImage()),
      );
    } else {
      return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: Container(
            width: 40,
            height: character.isDown?32:40,
            child: Image.asset(_getImage()),
          ));
    }
  }

  String _getImage() {

    if(character.isDown){
      return 'images/mario_down.png';
    }

    RunningState running = character.runningState;
    switch (running) {
      case RunningState.midRun:
        return 'images/mario_half_walk.png';

      case RunningState.fullRun:
        return 'images/mario_full_walk.png';

      default:
        return 'images/mario_stand.png';
    }
  }
}
