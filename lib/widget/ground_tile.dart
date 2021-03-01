import 'package:flutter/cupertino.dart';

class GroundTile extends StatelessWidget {

  const GroundTile(this.width,this.height);
 final double width;
 final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image:DecorationImage(
          image:AssetImage('images/ground_tile.jpg'),
          fit: BoxFit.cover,
        )
      ),
    );
  }
}
