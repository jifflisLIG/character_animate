import 'dart:async';

import 'package:first_game/enum/jumping_state.dart';
import 'package:first_game/enum/running.dart';
import 'package:first_game/enum/direction.dart';

class Character {
  Character({
    this.name,
    this.agility,
    this.strength,
    this.deltaY = 1,
    this.deltaX = -1,
    this.time = 0,
    this.height = 0,
    this.initialHeight,
    this.runningState = RunningState.stop,
    this.isRunning = false,
    this.jumpingState = JumpingState.jumpingUp,
    this.isJumping=false,
    this.direction = Direction.right,
    this.isDown=false,
  }) {
    this.initialHeight = this.deltaY;
  }

  String name;
  double agility;
  double strength;

  double deltaX = 1;
  double deltaY = -1;
  double time = 0;
  double height = 0;
  double initialHeight;

  bool isDown;
  bool isJumping;
  bool isRunning;
  RunningState runningState;
  JumpingState jumpingState;
  Direction direction;


  Character copyWith({
    String name,
    double agility,
    double strength,
    double deltaX,
    double deltaY,
    bool isJump,
    RunningState runningState,
    JumpingState jumpingState,
    bool isRunning,
    Direction direction,
    bool isDown,
  }) {
    return Character(
      name: name ?? this.name,
      agility: agility ?? this.agility,
      strength: strength ?? this.strength,
      deltaX: deltaX ?? this.deltaX,
      deltaY: deltaY ?? this.deltaY,
      isJumping: isJump ?? this.isJumping,
      runningState: runningState ?? this.runningState,
      jumpingState: jumpingState??this.jumpingState,
      time: time ?? this.time,
      height: height ?? this.height,
      initialHeight: initialHeight ?? this.initialHeight,
      isRunning: isRunning??this.isRunning,
      direction: direction??this.direction,
      isDown: isDown??this.isDown,
    );
  }


  void run(Direction direction,Function update){
    isRunning = true;
    this.direction = direction;

    Timer.periodic(Duration(milliseconds: 50), (timer)  {
      _setRunningState();

      if(!isRunning){
        update();
        timer.cancel();
        return;
      }

      if(this.direction==Direction.left){
        deltaX -= .02;
      }else{
        deltaX += .02;
      }

      update();
    });

  }


  void _setRunningState(){

    if(!isRunning){
      runningState = RunningState.stop;
      return;
    }

    if(runningState == RunningState.stop){
      runningState = RunningState.midRun;
      return;
    }

    if(runningState==RunningState.midRun){
      runningState=RunningState.fullRun;
      return;
    }

    if(runningState==RunningState.fullRun){
      runningState = RunningState.midRun;
      return;
    }
  }


  void _preJump() {
    time = 0;
    initialHeight = deltaY;
  }

  void jump(Function update) {
    if(isJumping){
      return;
    }

    _preJump();
    Timer.periodic(Duration(milliseconds: 50), (timer) async {
      final double height = -4.9 * time * time + 5 * time;

      //check jumping state
      if(this.height < height){
        jumpingState= JumpingState.jumpingDown;
      }else{
       jumpingState= JumpingState.jumpingUp;
      }

      time += 0.05;
      this.height =height;
      isJumping = true;

      if (initialHeight - this.height > 1) {
        deltaY = 1;
        isJumping = false;
        update();
        timer.cancel();
      } else {
       deltaY = initialHeight - this.height;
      }

      update();
    });
  }
}
