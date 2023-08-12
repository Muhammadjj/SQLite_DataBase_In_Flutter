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
      const Center(child: Text("No Data Fetch"),)
     : ListView.builder(
      physics:const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: emptyList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 12,
            color: Colors.pink.withOpacity(0.5),
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
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            viewData();
          });
        },
        child:const Icon(Icons.refresh,color: Colors.red),
      ),
    );
  }
}
