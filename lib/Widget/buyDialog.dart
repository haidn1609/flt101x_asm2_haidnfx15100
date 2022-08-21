import 'package:flt101x_asm2_haidnfx15100/model/product_model.dart';
import 'package:flt101x_asm2_haidnfx15100/provider/productDetailViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyDialog extends StatelessWidget {
  BuyDialog({Key? key, required this.item});

  ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      backgroundColor: Colors.grey.shade300,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Consumer<ProductDetailViewModel>(
        builder: (context, data, child) => Container(
          padding: EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height < 420 ? 400 : 500,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 150,
                      height:
                          MediaQuery.of(context).size.height < 420 ? 120 : 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(item.imageUrl),
                            fit: BoxFit.contain),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          item.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.height < 420
                                  ? 15
                                  : 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          "${item.cost * data.counter}đ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.height < 420
                                  ? 10
                                  : 15),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Chi tiết sản phẩm",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          MediaQuery.of(context).size.height < 420 ? 15 : 20),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height < 420 ? 100 : 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(item.description),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                data.addCount();
                              },
                              icon: Icon(Icons.add_circle_outline)),
                          Text("${data.counter}"),
                          IconButton(
                              onPressed: () {
                                data.removeCount();
                              },
                              icon: Icon(Icons.remove_circle_outline)),
                        ],
                      ),
                    )),
                    Expanded(
                        child: MediaQuery.of(context).size.height < 420
                            ? Row(
                                children: [
                                  Container(
                                    width: 110,
                                    margin: EdgeInsets.only(left: 5),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        onPressed: () {
                                          data.addItemBuy(item, data.counter);
                                          print("add succes");
                                          Navigator.pop(context);
                                        },
                                        child: Text("Xác nhận")),
                                  ),
                                  Container(
                                    width: 110,
                                    margin: EdgeInsets.only(left: 5),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Hủy bỏ")),
                                  )
                                ],
                              )
                            : Column(children: [
                                Container(
                                  width: 110,
                                  margin: EdgeInsets.only(left: 5),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green),
                                      onPressed: () {
                                        data.addItemBuy(item, data.counter);
                                        print("add succes");
                                        Navigator.pop(context);
                                      },
                                      child: Text("Xác nhận")),
                                ),
                                Container(
                                  width: 110,
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Hủy bỏ")),
                                )
                              ])),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
