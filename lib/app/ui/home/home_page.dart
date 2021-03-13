import 'package:flutter/material.dart';
import 'package:flutter_shaadi/app/controller/home_controller.dart';
import 'package:flutter_shaadi/app/ui/home/people_card.dart';
import 'package:flutter_shaadi/app/ui/widget/avatar_image.dart';
import 'package:flutter_shaadi/app/ui/widget/loading_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      return PeopleCard(people: _.peopleList[index]);
                    },
                    itemCount: _.peopleList.length,
                  );
          },
        ),
      ),
    );
  }
}
