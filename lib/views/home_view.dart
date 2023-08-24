import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "New York Times",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.logout_sharp,
            color: Colors.white,
          ),
          onPressed: () async {
            await controller.signOut();
          },
        ),
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.newsList.length,
            itemBuilder: (BuildContext context, int index) {
              final currentNews = controller.newsList[index];

              return ExpansionTile(
                tilePadding: const EdgeInsets.all(2),
                backgroundColor: Colors.grey[200],
                collapsedBackgroundColor:
                    const Color.fromARGB(255, 255, 255, 255),
                title: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(currentNews.smallPicture),
                      radius: 30,
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        currentNews.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontStyle: FontStyle.normal,
                          fontFamily: AutofillHints.name,
                        ),
                      ),
                    ),
                  ],
                ),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(21)),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            )),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Image.network(
                            currentNews.bigPicture,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              )),
                          width: 440,
                          child: Column(children: [
                            Text(
                              currentNews.abstract,
                              textAlign: TextAlign.justify,
                            ),
                          ])),
                      const Padding(padding: EdgeInsets.all(7)),
                      Text(
                        'Published Date: ' + currentNews.publishedDate,
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  )
                ],
              );
            },
          )),
    );
  }
}
