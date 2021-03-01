import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/main_bloc.dart';
import '../enum/direction.dart';
import '../state/main_state.dart';
import 'character_jumping.dart';
import 'character_running.dart';
import 'ground.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(context),
          _buildArrowLeft(context),
          _buildArrowRight(context),
          _buildArrowJump(context),
          _buildArrowDown(context),
        ],
      ),
    );
  }

  Widget _buildArrowJump(BuildContext context) {
    return Positioned(
      right: 70,
      bottom: 90,
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<MainBloc>(context).jumpCharacter();
        },
        child: Container(
          width: 60,
          height: 60,
          decoration:
              BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
          child: Icon(Icons.arrow_upward),
        ),
      ),
    );
  }

  Widget _buildArrowDown(BuildContext context) {
    return Positioned(
      right: 70,
      bottom: 15,
      child: GestureDetector(
        onTapDown: (data) {
          BlocProvider.of<MainBloc>(context).setDownStatus(true);
        },
        onTapUp: (data) {
          BlocProvider.of<MainBloc>(context).setDownStatus(false);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration:
              BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
          child: Icon(Icons.arrow_downward),
        ),
      ),
    );
  }

  Widget _buildArrowRight(BuildContext context) {
    return Positioned(
      left: 120,
      bottom: 24,
      child: GestureDetector(
        onTapDown: (data) {
          BlocProvider.of<MainBloc>(context).runCharacter(Direction.right);
        },
        onTapUp: (data) {
          BlocProvider.of<MainBloc>(context).setRunningStatus(false);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration:
              BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
          child: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  Widget _buildArrowLeft(BuildContext context) {
    return Positioned(
      left: 24,
      bottom: 24,
      child: GestureDetector(
        onTapDown: (data) {
          BlocProvider.of<MainBloc>(context).runCharacter(Direction.left);
        },
        onTapUp: (data) {
          BlocProvider.of<MainBloc>(context).setRunningStatus(false);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.yellow,
          ),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 20,
          child: _buildSurface(context),
        ),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
            )),
        Expanded(
            flex: 5,
            child: Container(
              color: Colors.brown,
              child: Column(
                children: [
                  Ground(MediaQuery.of(context).size.width,90),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildSurface(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (BuildContext context, MainState state) {},
      builder: (BuildContext context, MainState state) {
      if (state is GameState) {
          return AnimatedContainer(
            alignment:
                Alignment(state.character.deltaX, state.character.deltaY),
            duration: Duration(milliseconds: 0),
            color: Colors.blue,
            child: state.character.isJumping
                ? CharacterJumping(state.character)
                : CharacterRunning(state.character),
          );
        }

        return Container(
          color: Colors.blue,
        );
      },
    );
  }
}
