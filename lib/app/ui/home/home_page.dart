import 'package:flutter/material.dart';
import 'package:flutter_shaadi/app/controller/home_controller.dart';
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
                      return Column(
                        children: [
                          CircleAvatar(
                            child: Image.network(
                                _.peopleList[index].picture.large),
                          ),
                          ListTile(
                            title: Text(_.peopleList[index].name.first ?? 'a'),
                            subtitle:
                                Text(_.peopleList[index].name.last ?? 'b'),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Decline'),
                              Text('Decline'),
                            ],
                          )
                        ],
                      );
                    },
                    itemCount: _.peopleList.length,
                  );
          },
        ),
      ),
    );
  }
}
