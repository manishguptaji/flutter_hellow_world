import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'list_controller.dart';

class HomeView extends GetView<ListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Filter'),
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
                  itemBuilder: (context, index) => ListItem(context, index, controller)
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
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
  subtitle: Text(controller.filterData.value[index]['capital'] ?? "NA",));
}