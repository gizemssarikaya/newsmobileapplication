import 'package:dictionary_web/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dictionary_web/service/news_service.dart';

@immutable
class FirstPage extends GetView<LoginController> {
  late news_Service news;

  FirstPage()  {
    super.key;
    news =  news_Service();
    print("first  page lenght");
    print(news.objects.length);
    
  }

  @override
  Widget build(BuildContext context) {
    var itemData = news.objects;
    print(news.objects.length);
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: itemData.length,
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
                        itemData[index].abstract,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                            letterSpacing: 0.3,
                            height: 1.3),
                      ),
                    ],
                  ),
                ),
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      itemData[index].title,
                      style: const TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
                isExpanded: itemData[index].isExpanded,
              )
            ],
            expansionCallback: (int item, bool status) {
              controller.changeisExpanded(itemData[index]);
            },
          );
        },
      ),
    ));
  }
}
