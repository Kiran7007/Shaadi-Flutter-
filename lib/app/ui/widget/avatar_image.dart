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
      child: CircleAvatar(
        minRadius: 10,
        backgroundColor: Colors.grey[100],
        child:
            url?.isEmpty ?? false ? Text(getInitials(name)) : ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(url,),
            ),
      ),
    );
  }
}
