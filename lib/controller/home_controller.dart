import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/product/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

FirebaseFirestore firestore=FirebaseFirestore.instance;
late CollectionReference productCollection;

TextEditingController ProductNameCtrl=TextEditingController();
TextEditingController ProductDescriptionCtrl=TextEditingController();
TextEditingController ProductImgCtrl=TextEditingController();
TextEditingController ProductPriceCtrl=TextEditingController();

String category='General';
String brand='Brand';
String offer='False';

List<Product>products=[];


String test='test String';
@override
Future<void> onInit()
async {
productCollection=firestore.collection('products');
await fetchProducts();
super.onInit();
}
addProduct()
{
try {
  DocumentReference doc=productCollection.doc();
  Product product=Product(
    id:doc.id,
    name:ProductNameCtrl.text,
    category: category,
    description:ProductDescriptionCtrl.text ,
    price:double.tryParse(ProductPriceCtrl.text),
    brand:brand,
    image:ProductImgCtrl.text,
    offer:false,
  );
final productJson=product.toJson();
doc.set(productJson);
Get.snackbar('Success', 'Product added successfully',colorText:Colors.green);
setValuesDefault();
} 
catch (e) {
Get.snackbar('Error', e.toString(),colorText:Colors.green);
print(e);
}
}

fetchProducts()
async {
  try {
  QuerySnapshot productSnapshot =await productCollection.get();
  final List<Product>retrievedProducts=productSnapshot.docs.map((doc)=>Product.fromJson(doc.data() as Map<String,dynamic>)).toList();
  products.clear();
  products.assignAll(retrievedProducts);
  Get.snackbar('Success','Product fetched Successfully',colorText: Colors.green);
}  catch (e) {
   Get.snackbar('Error',e.toString(),colorText: Colors.red);
}
finally
{
  update();
}
}

deleteProduct(String id)
async {
  try {
  await productCollection.doc(id).delete();
  fetchProducts();
}  catch (e) {
  Get.snackbar('Error', e.toString(),colorText:Colors.red);
  print(e);
  // TODO
}
}

setValuesDefault()
{
ProductNameCtrl.clear();
ProductDescriptionCtrl.clear();
ProductImgCtrl.clear();
ProductPriceCtrl.clear();

category='General';
brand='Brand';
offer='false';
update();
}

}