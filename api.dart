import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List products = [];
  var item;
  bool circular = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Map<String, dynamic> data = {
      "currentpage": 1,
      "pagesize": 10,
      "sortorder": {"field": "menu_name", "direction": "desc"},
      "searchstring": "",
      "filter": {"Category": ""}
    };
    var uri = Uri.parse("http://fda.intertoons.com/api/V1/products");
    var res = await http.post(uri,
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer akhil@intertoons.com"
        },
        body: json.encode(data));

    var r = jsonDecode(res.body);

    setState(() {
      circular = false;
      products = r["data"]["products"];
      print(products);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
