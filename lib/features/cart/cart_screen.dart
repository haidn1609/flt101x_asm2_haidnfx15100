import 'package:flt101x_asm2_haidnfx15100/provider/productDetailViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../model/product_model.dart';

class CartScreen extends StatefulWidget {
  @override
  CartScreenState createState() {
    return CartScreenState();
  }
}

class CartScreenState extends State<CartScreen> {
  // late Animation<double> animation;
  // late AnimationController controller;
  List<PopupMenuItem<String>> _itemMenu = [];

  final TextEditingController nameEdit = TextEditingController();
  final TextEditingController phoneEdit = TextEditingController();
  final TextEditingController adresEdit = TextEditingController();
  final TextEditingController tipEdit = TextEditingController();
  final TextEditingController couponEdit = TextEditingController();

  @override
  void initState() {
    //  popup
    _itemMenu.add(new PopupMenuItem<String>(
        child: Text(
      "Tài khoản",
      style: TextStyle(color: Colors.white),
    )));
    _itemMenu.add(new PopupMenuItem<String>(
        child: Text(
      "Lịch sử đơn hàng",
      style: TextStyle(color: Colors.white),
    )));
    _itemMenu.add(new PopupMenuItem<String>(
        child: Text(
      "Sản phẩm yêu thích",
      style: TextStyle(color: Colors.white),
    )));
    _itemMenu.add(new PopupMenuItem<String>(
        child: Text(
      "Đăng xuất",
      style: TextStyle(color: Colors.white),
    )));
  }

  void _showDialog(
      bool checkName, bool checkPhone, boolCheckAddresh, boolCheckCount) {
    var providerControl =
        Provider.of<ProductDetailViewModel>(context, listen: false);
    ToastContext().init(context);
    if (checkName && checkPhone && boolCheckAddresh && boolCheckCount) {
      Toast.show("Đặt hàng thành công",
          duration: Toast.lengthShort,
          gravity: Toast.center,
          backgroundColor: Colors.grey.shade300,
          textStyle: TextStyle(color: Colors.green, fontSize: 15));
      providerControl.clearCart();
      nameEdit.clear();
      phoneEdit.clear();
      adresEdit.clear();
      tipEdit.clear();
      couponEdit.clear();
    } else {
      Toast.show("Đặt hàng thất bại",
          duration: Toast.lengthShort,
          gravity: Toast.center,
          backgroundColor: Colors.grey.shade300,
          textStyle: TextStyle(color: Colors.green, fontSize: 15));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailViewModel>(
      builder: (context, value, child) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: Builder(
                builder: (context) => PopupMenuButton(
                  constraints:
                      BoxConstraints(minWidth: 2.0 * 56.0, minHeight: 500),
                  offset: Offset(0, 57),
                  color: Colors.green,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black38,
                  ),
                  itemBuilder: (context) {
                    return _itemMenu;
                  },
                ),
              ),
              title: Text(
                "Giỏ hàng",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              backgroundColor: Colors.grey.shade100,
              actions: [
                Container(
                  padding: EdgeInsets.only(right: 25),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                )
              ],
            ),
            body: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 25, left: 20),
                      child: Text(
                        "Nhập tên địa chỉ của người nhận",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: TextField(
                        controller: nameEdit,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Tên khách hàng",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: TextField(
                        controller: phoneEdit,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Số điện thoại khách hàng",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: TextField(
                        controller: adresEdit,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Địa chỉ khách hàng",
                        ),
                      ),
                    ),
                    Container(
                      height: 5 * 24,
                      padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: TextField(
                        maxLines: 5,
                        showCursor: false,
                        controller: tipEdit,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Ghi chú",
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25, left: 20),
                      child: Text(
                        "Chi tiết đơn hàng",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      child: value.buyProducts.length <= 0
                          ? Container(
                              child: Center(
                                child: Text("Chưa có sản phẩm"),
                              ),
                            )
                          : Container(
                              child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 25, right: 25),
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(),
                                        flex: 3,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Text("Số lượng"),
                                          ),
                                        ),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Text("Đơn giá"),
                                          ),
                                        ),
                                        flex: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                  itemCount: value.buyProducts.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Center(
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.black,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            new Radius.circular(
                                                                10.0))),
                                                child: Center(
                                                  child: Text("${index + 1}"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Center(
                                              child: Container(
                                                child: Image(
                                                  image: NetworkImage(value
                                                      .buyProducts[index]
                                                      .imageUrl),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                                "${value.buyProducts[index].name}",
                                                textAlign: TextAlign.left),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                  "${value.countItemBuy["${value.buyProducts[index].id}"]}"),
                                            ),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: Container(
                                              child: Center(
                                            child: Text(
                                                "${(value.countItemBuy["${value.buyProducts[index].id}"])! * value.buyProducts[index].cost}đ"),
                                          )),
                                          flex: 1,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            )),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 35, right: 25),
                      child: TextField(
                          controller: couponEdit,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Mã giảm giá",
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.only(
                          top: 10, left: 20, bottom: 20, right: 25),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Tạm tính",
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                  "${value.getSumCost()} đ",
                                  textAlign: TextAlign.right,
                                )),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Khuyến mãi:",
                                  textAlign: TextAlign.left,
                                )),
                                Expanded(
                                    child: Text(
                                  "0 đ",
                                  textAlign: TextAlign.right,
                                )),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Phí vận chuyển:",
                                  textAlign: TextAlign.left,
                                )),
                                Expanded(
                                    child: Text(
                                  value.buyProducts.isEmpty ? "0 đ" : "5000 đ",
                                  textAlign: TextAlign.right,
                                )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 1,
                            color: Colors.black,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Tổng cộng:",
                                  textAlign: TextAlign.left,
                                )),
                                Expanded(
                                    child: Text(
                                  "${value.buyProducts.isEmpty ? 0 : 5000 + value.getSumCost()} đ",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () => _showDialog(
                              nameEdit.text.toString().replaceAll(" ", "")!="",
                              phoneEdit.text.toString().replaceAll(" ", "")!="",
                              adresEdit.text.toString().replaceAll(" ", "")!="",
                              value.buyProducts.isNotEmpty),
                          child: Center(
                            child: Text(
                              "ĐẶT HÀNG",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              maximumSize: Size.fromWidth(200),
                              primary: Colors.green),
                        ),
                      ),
                    )
                  ],
                )));
      },
    );
  }
}
