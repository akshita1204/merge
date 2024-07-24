import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:flutter_application_1/pages/add_project_page.dart';

import 'package:get/get.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Footware Admin'),
        ),
        body: ListView.builder(
          itemCount:ctrl.products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title:Text(ctrl.products[index].name??''),
              subtitle:Text((ctrl.products[index].price??0).toString()), //Text((ctrl.products[index].price ?? 0).toString()), 
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  ctrl.deleteProduct(ctrl.products[index].id ?? '');
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddProjectPage());
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
