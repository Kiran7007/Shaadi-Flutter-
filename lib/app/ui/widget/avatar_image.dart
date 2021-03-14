import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String url;
  Avatar({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
          image:
              DecorationImage(image: NetworkImage(this.url), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
