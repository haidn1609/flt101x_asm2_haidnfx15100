import 'package:flt101x_asm2_haidnfx15100/Widget/buyDialog.dart';
import 'package:flt101x_asm2_haidnfx15100/provider/productDetailViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import 'dart:async';

class GridViewShowItem extends StatefulWidget {
  GridViewShowItem(
      {Key? key,
      required this.listShow,
      required this.shrinkWrap,
      required this.scrollPhysics});

  List<ProductModel> listShow;
  bool shrinkWrap;
  ScrollPhysics scrollPhysics;

  @override
  _GridViewShowItemState createState() {
    return new _GridViewShowItemState(
        listShow: listShow,
        shrinkWrap: shrinkWrap,
        scrollPhysics: scrollPhysics);
  }
}

class _GridViewShowItemState extends State<GridViewShowItem> {
  _GridViewShowItemState(
      {Key? key,
      required this.listShow,
      required this.shrinkWrap,
      required this.scrollPhysics});

  List<ProductModel> listShow;
  bool shrinkWrap;
  ScrollPhysics scrollPhysics;

  Widget _itemGridView(ProductModel item) {
    return Consumer<ProductDetailViewModel>(
      builder: (context, value, child) => GridTile(
          child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: GestureDetector(
          onTap: () {
            print("click item ${item.name}");
            value.resetCount();
            _showDialog(context, item);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(item.imageUrl))),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("${item.cost.round()}đ")
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: null,
                                        icon: Icon(
                                            Icons.add_shopping_cart_outlined),
                                        color: Colors.black,
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, right: 15),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              item.isLike = !item.isLike;
                            });
                          },
                          icon: _iconLike(item.isLike)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Icon _iconLike(bool _isLike) {
    if (_isLike) {
      return Icon(
        CupertinoIcons.heart_fill,
        color: Colors.green,
      );
    } else
      return Icon(
        CupertinoIcons.heart,
        color: Colors.green,
      );
  }

  Future _showDialog(BuildContext context, ProductModel _item) async {
    return showDialog(
      context: context,
      builder: (context) => BuyDialog(item: _item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Center(
        child: GridView.count(
          physics: scrollPhysics,
          shrinkWrap: shrinkWrap,
          crossAxisCount: MediaQuery.of(context).size.width <= 550 ? 2 : 3,
          childAspectRatio: 3 / 4,
          children: listShow.map(_itemGridView).toList(),
        ),
      ),
    );
  }
}
