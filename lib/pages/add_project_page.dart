import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:flutter_application_1/widgets/drop_down_btn.dart';
import 'package:get/get.dart';

class AddProjectPage extends StatelessWidget {
AddProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
     return GetBuilder<HomeController>(builder: (ctrl) {
    return Scaffold(
   appBar: AppBar(title: Text('Add Product'),),

   body:SingleChildScrollView( 
     child: Container(
      margin:EdgeInsets.all(10),
      width: double.maxFinite,
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
       
          Text('Add New Product',
          style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.purple)
          ),
     
        TextField(
          controller: ctrl.ProductNameCtrl,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(10)),
                label: Text('Product Name'),
                hintText:'Enter your Product Name',
                ),
          ),
        SizedBox(height:10),

        TextField(
          controller: ctrl.ProductDescriptionCtrl,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(10)),
                label: Text('Product Description'),
                hintText:'Enter your Product Description',
                ),
                maxLines: 4,
          ),
          SizedBox(height:10),

          TextField(
            controller: ctrl.ProductImgCtrl,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(10)),
                label: Text('Image URL'),
                hintText:'Enter your Image URL',
                ),
          ),
          SizedBox(height:10),

          TextField(
            controller: ctrl.ProductPriceCtrl,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(10)),
                label: Text('Product Price'),
                hintText:'Enter your Product Price',
                ),   
          ),
        SizedBox(height:10),

        Row(children: [
            Flexible(child: DropDownBtn(items: const['Boots','Shoes','Heels','Flats'], SelectedItemText: ctrl.category, onSelecetd: (selectedValue ) { ctrl.category=selectedValue??'General'; ctrl.update();},),),
            Flexible(child: DropDownBtn(items: ['Puma','Adidas','Sketchers','Clarks'], SelectedItemText: ctrl.brand, onSelecetd: (selectedValue ) { ctrl.brand=selectedValue??'Brand';ctrl.update(); },),),   
          ],),
        SizedBox(height:10),

        Text('Offer Product?'),
        SizedBox(height:10),

DropDownBtn(items: ['True','False'], SelectedItemText: ctrl.offer, onSelecetd: (selectedValue ) { ctrl.offer=selectedValue??'Offer' ; ctrl.update();},),
         SizedBox(height:10),

         ElevatedButton(
          style:ElevatedButton.styleFrom(
           backgroundColor: Colors.purple,
           foregroundColor: Colors.white,
          ),
          onPressed: (){
            ctrl.addProduct();
          }, child: Text('Add Product'))
        

        ],
        ),
     ),
   ),

    );
     });
  }
  }
