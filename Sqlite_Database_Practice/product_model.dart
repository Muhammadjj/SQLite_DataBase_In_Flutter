class Products {
  int? productId;
  String? productImage;
  String? productName;
  int? productPrice;


  // ** Constructor working update this insert data OR update data 
  Products({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

// ** (Products.fromMap ) Using for fetch data 
  Products.fromMap(Map<String, dynamic> map) {
    productId = map["productId"];
    productImage = map["productImage"];
    productName = map["productName"];
    productPrice = map["productPrice"];
  }


// ** (toMap) Using for insert data.
  Map<String, dynamic> toMap() {
  return  {
    "productId" : productId,
    "productImage" : productImage,
    "productName" : productName,
    "productPrice": productPrice 
    };
    
  }

}
