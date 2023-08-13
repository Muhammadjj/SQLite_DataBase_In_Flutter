import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqlite_database_self_practice/Screens/Sqlite_Database_Practice/product_model.dart';

import '../CONSTANT/product_db_provider.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  ProductDB fetchAllData = ProductDB();
  List<Products> emptyList = [];
  Random random = Random();
  viewData() async {
    emptyList = await fetchAllData.fetchingData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    viewData();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        title: const Text("DataBase Fetching Data"),
      ),
      body:emptyList.isEmpty ? 
      const Center(child: SizedBox(
        height: 100,
        width: 100,
        child: Image(image: AssetImage("assest/images/notepad.png"),fit: BoxFit.fill)),)
     : Column(
       children: [
        const SizedBox(
              height: 5,),
           const Center(child: Text("Fetch Data",
           style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
           const SizedBox(
              height: 10,),
         Expanded(
           child: ListView.builder(
            physics:const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: emptyList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 12,
                  color: Colors.primaries[index % 5],
                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.lime,
                        child: Text(emptyList[index].productId.toString())),
                    title: Text(emptyList[index].productImage.toString()),
                    subtitle: Text(emptyList[index].productPrice.toString()),
                    trailing: IconButton(
                        onPressed: () async{
                          bool deleteListTile =await fetchAllData.deleteData(emptyList[index].productId);
                          if (deleteListTile) {
                           setState(() {
                              viewData();
                           });
                          }else{
                            print("Don,t Delete Data ******@********** @@@@@@@@@@@@@@@@@@@*@@@@@@@@@@@@@@@@@@ ");
                          }
                        },
                        icon:  Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255)),
                        )),
                  ),
                );
              },
            ),
         ),
       ],
     ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            viewData();
          });
        },
        child:const Icon(Icons.refresh,color: Colors.black),
      ),
    );
  }
}
