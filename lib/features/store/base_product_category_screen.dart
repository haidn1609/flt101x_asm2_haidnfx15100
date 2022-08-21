import 'package:flt101x_asm2_haidnfx15100/Widget/gridViewShowItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/productDetailViewModel.dart';
import '../mock_data.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() {
    return new _StoreScreenState();
  }
}

class _StoreScreenState extends State<StoreScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var providerControl =
        Provider.of<ProductDetailViewModel>(context, listen: false);
    providerControl.getVegetableProducts();
    providerControl.getMeatProducts();
    providerControl.getAppliancesProducts();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Consumer<ProductDetailViewModel>(
        builder: (context, data, child) {
          return new Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.white,
              flexibleSpace: new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  new TabBar(
                    indicatorWeight: 10,
                    indicatorColor: CupertinoColors.systemBlue,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    tabs: [
                      new Tab(
                          child: Center(
                        child: Text(
                          "Rau củ quả",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                      new Tab(
                          child: Center(
                        child: Text("Thịt cá",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )),
                      new Tab(
                          child: Center(
                        child: Text("Đồ gia dụng",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            body: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: TabBarView(
                children: [
                  GridViewShowItem(
                      listShow: data.vegetableProducts,
                      shrinkWrap: false,
                      scrollPhysics: ScrollPhysics()),
                  GridViewShowItem(
                      listShow:data.meatProducts,
                      shrinkWrap: false,
                      scrollPhysics: ScrollPhysics()),
                  GridViewShowItem(
                      listShow: data.appliancesProducts,
                      shrinkWrap: false,
                      scrollPhysics: ScrollPhysics()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
