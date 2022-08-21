import 'package:flt101x_asm2_haidnfx15100/model/product_model.dart';
import 'package:flt101x_asm2_haidnfx15100/provider/productDetailViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widget/gridViewShowItem.dart';
import '../mock_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return new _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var providerControl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providerControl =
        Provider.of<ProductDetailViewModel>(context, listen: false);
    providerControl.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailViewModel>(
      builder: (context, data, child) {
        return ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              shrinkWrap: true,
              children: [
                Image.network(
                  "https://img.upanh.tv/2022/08/02/banner.png",
                  fit: BoxFit.fill,
                ),
                GridViewShowItem(
                  listShow: data.products,
                  shrinkWrap: true,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                )
              ],
            ));
      },
    );
  }
}
