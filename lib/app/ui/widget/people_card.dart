import 'package:flutter/material.dart';
import 'package:flutter_shaadi/app/data/model/people.dart';
import 'package:flutter_shaadi/app/ui/widget/avatar_image.dart';
import 'package:flutter_shaadi/app/ui/widget/card_button.dart';

class PeopleCard extends StatelessWidget {
  final People people;
  PeopleCard({this.people});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            child: Avatar(url: people.imageUrl, name: people.fullName),
          ),
          ListTile(
            title: Text('${people.initial} ${people.fullName}'),
            subtitle: Text(people.imageUrl),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CardButton(
                  text: 'Decline',
                  icon: Icons.accessible_forward_sharp,
                  color: Colors.redAccent,
                  onPress: () => {}),
              CardButton(
                  text: 'Accept',
                  icon: Icons.deck_rounded,
                  color: Colors.green,
                  onPress: () => {}),
            ],
          )
        ],
      ),
    );
  }
}
