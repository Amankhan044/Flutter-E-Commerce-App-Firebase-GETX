import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

import 'widget/order_list_items.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: UAppBar(showBackArrow: true, title: Text('My Orders', style: Theme.of(context).textTheme.headlineMedium,),),
      body: Padding(padding: UPadding.screenPadding, child: UOrderListItems(),),
    );
  }
}