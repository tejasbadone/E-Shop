import 'package:catelog_app/models/cart.dart';
import 'package:catelog_app/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatelogModel? catelog;
  CartModel? cart;

  MyStore() {
    catelog = CatelogModel();
    cart = CartModel();
    cart!.catelog = catelog!;
  }
}
