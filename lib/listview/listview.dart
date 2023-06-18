import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'list_controller.dart';

class HomeView extends GetView<ListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Filter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => controller.filterDataBy(value),
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: controller.filterData.value.length,
                  itemBuilder: (context, index) => ListItem2(context, index, controller)
              ),
            ),)
          ]
        ),
      ),
    );
  }
}

Widget ListItem(BuildContext context, int index, ListController controller) {
  return ListTile(
  title: Text(controller.filterData.value[index]['name'] ?? "NA",
  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
  subtitle: Text(controller.filterData.value[index]['capital'] ?? "NA",)
  );
}

Widget ListItem2(BuildContext context, int index, ListController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(controller.filterData.value[index]['name'] ?? "NA"),
                    const Text('Date'),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.20,
              color: Colors.blue,
              child: Center(
                child: Text(controller.filterData.value[index]['capital'] ?? "NA"),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.camera_alt),
              Icon(Icons.camera_enhance),
              Icon(Icons.camera_rear),
              Icon(Icons.card_membership)
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    ),
  );
}