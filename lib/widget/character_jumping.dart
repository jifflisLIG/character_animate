import 'dart:math';

import 'package:first_game/enum/direction.dart';
import 'package:first_game/enum/jumping_state.dart';
import 'package:first_game/model/character.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../enum/running.dart';

class CharacterJumping extends StatelessWidget {
  const CharacterJumping(this.character);

  final Character character;

  @override
  Widget build(BuildContext context) {
    if (character.direction == Direction.left) {
      return Container(
        width: 40,
        height: 40,
        child: Image.asset(_getImage()),
      );
    } else {
      return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: Container(
            width: 40,
            height: 40,
            child: Image.asset(_getImage()),
          ));
    }
  }

  String _getImage() {
    JumpingState jumping = character.jumpingState;
    switch (jumping) {
      case JumpingState.jumpingUp:
        return 'images/mario_jump_up.png';

      case JumpingState.jumpingDown:
        return 'images/mario_jump_down.png';
      default:
        return 'images/mario_stand.png';
    }
  }
}
