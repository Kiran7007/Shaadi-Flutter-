import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String url;
  final String name;

  Avatar({@required this.url, @required this.name}) : assert(name != null);

  String getInitials(String fullName) {
    List<String> names = fullName.split(" ");
    String initials = "";
    int numWords = 2;

    if (numWords < names.length) {
      numWords = names.length;
    }

    for (var i = 0; i < numWords; i++) {
      initials += '${names[i][0]}';
    }
    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
          image: DecorationImage(
              image: NetworkImage(this.url),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
