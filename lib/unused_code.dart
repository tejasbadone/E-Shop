import 'package:catelog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

import 'models/catelog.dart';

// Old App bar with Grid tile
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Catelog App',
            textScaleFactor: 1.2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatelogModel.items != null && CatelogModel.items!.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = CatelogModel.items![index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GridTile(
                      header: Container(
                        child: Text(
                          item.name!,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                      ),
                      child: Image.network(item.image!),
                      footer: Container(
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                    ),
                  );
                },
                itemCount: CatelogModel.items!.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}

// List View Builder code-
// ListView.builder(
// itemCount: CatelogModel.items.length,
// itemBuilder: (context, index) => ItemWidgets(
// item: CatelogModel.items[index],
// ),
// )

// Toggle Theme button
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [

// SizedBox(
//   width: 20.0,
// ),
// FlutterSwitch(
//   width: 70,
//   height: 45,
//   toggleSize: 45.0,
//   value: state,
//   borderRadius: 30.0,
//   padding: 2.0,
//   activeToggleColor: Color(0xFF6E40C9),
//   inactiveToggleColor: Color(0xFF2F363D),
//   activeSwitchBorder: Border.all(
//     color: Color(0xFF3C1E70),
//     width: 6.0,
//   ),
//   inactiveSwitchBorder: Border.all(
//     color: Color(0xFFD1D5DA),
//     width: 6.0,
//   ),
//   activeColor: Color(0xFF271052),
//   inactiveColor: Colors.white,
//   activeIcon: Icon(
//     Icons.nightlight_round,
//     color: Color(0xFFF8E3A1),
//   ),
//   inactiveIcon: Icon(
//     Icons.wb_sunny,
//     color: Color(0xFFFFDF5D),
//   ),
//   onToggle: (val) {
//     setState(() {
//     });
//   },
// ),
//   ],
// );

// var brightness = MediaQuery.of(context).platformBrightness;
// bool isDarkMode = brightness == Brightness.dark;
//
//
// final value = MediaQuery.of(context).platformBrightness == Brightness.dark
//     ? 'true'
//     : 'false';
