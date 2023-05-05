import 'dart:convert';
import 'package:catelog_app/core/store.dart';
import 'package:catelog_app/models/cart.dart';
import 'package:catelog_app/models/catelog.dart';
import 'package:catelog_app/utils/routes.dart';
import 'package:catelog_app/widgets/home_widgets/catelog_header.dart';
import 'package:catelog_app/widgets/home_widgets/catelog_list.dart';
import 'package:catelog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = 'API KEY HERE';
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    // final catelogJson =
    //     await rootBundle.loadString('assets/files/catelog.json');

    final response = await http.get(Uri.parse(url));
    final catelogJson = response.body;
    final decodedData = jsonDecode(catelogJson);
    var productsData = decodedData['products'];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(20, (index) => CatelogModel.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, dynamic store, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Colors.white,
            size: 22,
            count: _cart!.items.length,
            textStyle: TextStyle(
              color: Mytheme.darkBluishColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatelogHeader(),
              if (CatelogModel.items != null && CatelogModel.items!.isNotEmpty)
                CatelogList().py16().expand()
              else
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
