import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_database_self_practice/Screens/Sqlite_Database_Practice/CRUD_FILES/fetch_product.dart';
import 'package:sqlite_database_self_practice/Screens/Sqlite_Database_Practice/constant/product_db_provider.dart';
import 'package:sqlite_database_self_practice/Screens/Sqlite_Database_Practice/product_model.dart';

class InsertDataBase extends StatefulWidget {
  const InsertDataBase({super.key});

  @override
  State<InsertDataBase> createState() => _InsertDataBaseState();
}

class _InsertDataBaseState extends State<InsertDataBase> {
  ProductDB databaseClass = ProductDB();

   TextEditingController productIdController = TextEditingController();
   TextEditingController productNameController = TextEditingController();
   TextEditingController productImageController = TextEditingController();
   TextEditingController productPriceController = TextEditingController();

 

  @override
  void initState() {
    super.initState();
    productIdController = TextEditingController();
    productImageController = TextEditingController();
    productNameController = TextEditingController();
    productPriceController = TextEditingController();
  }

  @override 
  void dispose() {
    productIdController.dispose();
    productImageController.dispose();
    productNameController.dispose();
    productPriceController.dispose();
    super.dispose();
  }

  void insertingUserData() async {
    databaseClass.insertData(
        products: Products(
      productId: int.parse(productIdController.text),
      productName: productNameController.text,
      productImage: productImageController.text,
      productPrice: int.parse(productPriceController.text),
    ));
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Data Inserted Successfully")));
        
    productIdController.clear();
    productImageController.clear();
    productPriceController.clear();
    productNameController.clear();
    
    // try {
       
    // } catch (e) {
    //   Text("jawad gg **************************************${e.toString()}");
    // }
  }


  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
        appBar: AppBar(
            title: const Text("Insert Product Page"),
            centerTitle: true,
            actions: [
              GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const  FetchData(),)),
                  child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(Icons.face_retouching_natural))),
              const SizedBox(
                width: 10,
              )
            ]),
        body: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(12.0),
          scrollDirection: Axis.vertical,
          children: [
           const Center(child: Text("Insert Data",
           style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
            const SizedBox(
              height: 20,
            ),
            textFieldMethod(
              // validator: null,
              controller: productIdController,
              hintText: "Product Id",
              label: "Product Id",
            ),
            const SizedBox(
              height: 20,
            ),
            textFieldMethod(
              // validator: null,
              controller: productNameController,
              hintText: "Product Name",
              label: "Product Name",
            ),
            const SizedBox(
              height: 20,
            ),
            textFieldMethod(
              // validator: null,
              controller: productImageController,
              hintText: "Product Image",
              label: "Product Image",
            ),
            const SizedBox(
              height: 20,
            ),
            textFieldMethod(
              // validator: null,
              controller: productPriceController,
              hintText: "Product Price",
              label: "Product Price",
            ),
            const SizedBox(
              height: 30,
            ),
            CupertinoButton(
                color: Colors.green,
                onPressed: () {
                  insertingUserData();
                },
                child: const Text("Insert Data")),
          ],
        ));
  }

  TextFormField textFieldMethod(
      {FormFieldValidator? validator,
      String? hintText,
      String label = '',
      TextEditingController? controller}) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          border:const OutlineInputBorder(), hintText: hintText, label: Text(label)),
    );
  }
}






