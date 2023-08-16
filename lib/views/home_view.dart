import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {var isExpanded=false;
    return Scaffold(
      body: Obx(() => ListView.builder(
            itemCount: controller.newsList.length,
            itemBuilder: (BuildContext context, int index) {


              return ExpansionPanelList(
                animationDuration: Duration(milliseconds: 1000),
                dividerColor: Colors.red,
                elevation: 1,
                children: [
                  ExpansionPanel(
                    body: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            controller.newsList[index].abstract,
                            style: TextStyle(color: Colors.grey[700], fontSize: 15, letterSpacing: 0.3, height: 1.3),
                          ),
                        ],
                      ),
                    ),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          controller.newsList[index].title,
                          style: const TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    isExpanded: controller.isExpansion,
                  )
                ],
                expansionCallback: (int item, bool status) {
                  controller.changeisExpanded();
               },
              );
            },
          )),
    );
  }
}
