import 'package:flutter/material.dart';
import 'package:flutter_shaadi/app/controller/home_controller.dart';
import 'package:flutter_shaadi/app/data/model/people.dart';
import 'package:flutter_shaadi/app/ui/widget/avatar_image.dart';
import 'package:flutter_shaadi/app/ui/widget/card_button.dart';
import 'package:intl/intl.dart';

class PeopleCard extends StatelessWidget {
  final People people;
  final HomeController controller;
  PeopleCard({this.people, this.controller});

  String _getStatusMessage(bool isAccpeted){
      String message = people.connectionStatus == 'accepted' ? 'Accepted' : 'Declined';
      return '$message on ${DateFormat.yMMMd().format(DateTime.now())}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          children: [
            Avatar(url: people.imageUrl, name: people.fullName),
            ListTile(
              title: Text(
                '${people.initial}. ${people.fullName}\n(${people.gender[0].toUpperCase()} - ${people.age})',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF6200EE),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  people.address ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            people.isUpdated
                ? SizedBox(
                    width: double.infinity,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      color: Colors.grey[200],
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        _getStatusMessage(people.isUpdated),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ))
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CardButton(
                          text: 'Decline',
                          imagePath: 'assets/images/ic_decline.png',
                          color: Color.fromARGB(255, 227, 9, 9),
                          onPress: () {
                            print('${people.fullName} declined');
                            this.controller.updatePeople(this.people, false);
                          }),
                      CardButton(
                          text: 'Accept',
                          imagePath: 'assets/images/ic_accept.png',
                          color: Color.fromARGB(255, 40, 193, 5),
                          onPress: () {
                            print('${people.fullName} accepted');
                            this.controller.updatePeople(this.people, true);
                          }),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
