import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final Function onPress;
  final Color color;

  CardButton({this.text, this.imagePath, this.onPress, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: this.onPress,
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 30,
              height: 30,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              this.text,
              style: TextStyle(color: this.color,fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
