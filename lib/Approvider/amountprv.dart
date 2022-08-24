import 'package:flutter/material.dart';

import '../model/orderpr.dart';

class AmountProvider extends ChangeNotifier{
  int amount=0;
  List<OrderProduct>orderlist=[];
  void getamount(int newamt){
    amount=newamt;
    notifyListeners();
  }
  void getorderlist(List<OrderProduct>newworderlist){
    orderlist=newworderlist;
    notifyListeners();
  }
}