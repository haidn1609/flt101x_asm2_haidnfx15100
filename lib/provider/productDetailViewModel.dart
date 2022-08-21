import 'package:flt101x_asm2_haidnfx15100/features/mock_data.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductDetailViewModel extends ChangeNotifier {
//  Value
  late List<ProductModel> products;
  late List<ProductModel> vegetableProducts;
  late List<ProductModel> meatProducts;
  late List<ProductModel> appliancesProducts;
  late List<ProductModel> buyProducts =[];

  double counter = 1;
  Map<String, double> countItemBuy = Map();

  // int get counter => _counter;
//  fielvalue

  void getProducts() async {
    products = listProducts;
    notifyListeners();
  }

  void getVegetableProducts() async {
    vegetableProducts =
        listProducts.where((item) => item.category == 'vegetable').toList();
    notifyListeners();
  }

  void getMeatProducts() async {
    meatProducts =
        listProducts.where((item) => item.category == 'meat').toList();
    notifyListeners();
  }

  void getAppliancesProducts() async {
    appliancesProducts =
        listProducts.where((item) => item.category == 'appliances').toList();
    notifyListeners();
  }

  void resetCount() {
    counter = 1;
    notifyListeners();
  }

  void addCount() {
    counter++;
    notifyListeners();
  }

  void removeCount() {
    if (counter > 1) {
      counter--;
    } else {
      counter = 1;
    }
    notifyListeners();
  }

  void addItemBuy(ProductModel _itemBuy, double _countBuy) {
    if (buyProducts.isEmpty ||
        buyProducts.where((element) => element.id == _itemBuy.id).isEmpty) {
      buyProducts.add(_itemBuy);
      countItemBuy['${_itemBuy.id}'] = _countBuy;
    } else {
      countItemBuy['${_itemBuy.id}'] =
          countItemBuy['${_itemBuy.id}']! + _countBuy;
    }
    notifyListeners();
  }
  double getSumCost() {
    double tong = 0;
    if(buyProducts.isNotEmpty){
      for (int i = 0; i <buyProducts.length; i++) {
        tong += buyProducts[i].cost*(countItemBuy[buyProducts[i].id])!;
      }
    }
    return tong;
  }

  void clearCart(){
    buyProducts.clear();
    countItemBuy.clear();
    counter=0;
    notifyListeners();
  }
}
