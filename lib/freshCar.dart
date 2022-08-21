import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/cart/cart_screen.dart';
import 'features/fresh_car_home_screen.dart';



class FreshCar extends StatefulWidget {
  @override
  _FreshCarState createState() {
    return new _FreshCarState();
  }
}

class _FreshCarState extends State<FreshCar>
    with SingleTickerProviderStateMixin {
  // late Animation<double> animation;
  // late AnimationController controller;
  List<PopupMenuItem<String>> _itemMenu = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Animation
    // controller = new AnimationController(
    //     duration: new Duration(milliseconds: 3000), vsync: this);
    // animation = new Tween(begin: 0.0, end: 250.0).animate(controller);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => PopupMenuButton(
            constraints: BoxConstraints(minWidth: 2.0 * 56.0, minHeight: 500),
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
          "CHỢ ONLINE",
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.grey.shade100,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 25),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ));
                },
                icon: Icon(
                  Icons.local_grocery_store,
                  color: Colors.black38,
                )),
          )
        ],
      ),
      body: FreshCarHomeScreen(),
    );
  }
}