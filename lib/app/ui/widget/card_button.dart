import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPress;
  final Color color;

  CardButton({this.text, this.icon, this.onPress, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconButton(
            color: this.color,
            icon: Icon(this.icon),
            onPressed: this.onPress,
          ),
          Text(
            this.text,
            style: TextStyle(color: this.color),
          )
        ],
      ),
    );
  }
}
