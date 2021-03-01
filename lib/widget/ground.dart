import 'package:first_game/widget/ground_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ground extends StatelessWidget {
  const Ground(this.width,this.height);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      width: width,
      child: Row(
        children: [
          ...setGround()
        ],
      ),
    );
  }

  List<Widget> setGround() {
    List<Widget> widgets = <Widget>[];

    final double tileHeight = 35;
    final double tileWidth = 55;

    int tiles = width ~/ tileWidth;

    for(int i =0;i<tiles;i++){
      print('added');
      widgets.add(GroundTile(tileWidth, tileHeight));
    }

    return widgets;
  }
}
