import 'package:flutter/material.dart';
import 'package:flutter_shaadi/app/controller/home_controller.dart';
import 'package:flutter_shaadi/app/ui/widget/people_card.dart';
import 'package:flutter_shaadi/app/ui/widget/loading_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6200EE),
        title: Text(
          'Shaadi',
          textAlign: TextAlign.left,
        ),
      ),
      body: Container(
        child: GetX<HomeController>(
          initState: (state) {
            Get.find<HomeController>().getAll();
          },
          builder: (_) {
            return _.peopleList.length < 1
                ? LoadingWidget()
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return PeopleCard(
                          people: _.peopleList[index],
                          controller: this.controller);
                    },
                    itemCount: _.peopleList.length,
                  );
          },
        ),
      ),
    );
  }
}
