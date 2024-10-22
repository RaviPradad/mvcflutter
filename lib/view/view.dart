import 'package:flutter/material.dart';
import 'package:mvcflutter/controller/data_controller.dart';
import 'package:mvcflutter/locator.dart';
import 'package:mvcflutter/model/data_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    locator<DataController>().fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Data> data = Provider.of<DataController>(context).listData;
    bool isLoading = Provider.of<DataController>(context).isLoading;

    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Text("${data[index].email}");
              },
            ),
    );
  }
}
