import 'package:flt101x_asm2_haidnfx15100/features/cart/cart_screen.dart';
import 'package:flt101x_asm2_haidnfx15100/provider/productDetailViewModel.dart';
import 'package:flutter/material.dart';

import 'features/fresh_car_home_screen.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import 'freshCar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => ProductDetailViewModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "myapp",
      home: FreshCar(),
    );
  }
}

