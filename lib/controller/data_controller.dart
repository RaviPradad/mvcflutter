import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvcflutter/model/data_model.dart';

class DataController extends ChangeNotifier {
  String url = "https://reqres.in/api/users";

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Data> listData = [];

  Future<List<Data>> fetchData() async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(url)).catchError((e) {
        print("Response Error : ${e.toString()}");
        return http.Response("", -1);
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        listData = [...DataModel.fromJson(data).data ?? []];
      }
      _isLoading = false;
      notifyListeners();
      return listData;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      throw Exception("Failed something fetching data : $e");
    }
  }
}
