import 'package:flutter/material.dart';
import 'package:mvcflutter/controller/data_controller.dart';
import 'package:mvcflutter/locator.dart';
import 'package:mvcflutter/view/view.dart';
import 'package:provider/provider.dart';

void main() {
  intilizeLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => locator<DataController>())
        ],
        child: MaterialApp(
          home: Home(),
        ));
  }
}
