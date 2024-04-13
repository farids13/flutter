import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:note_apps/drawer.dart';
import 'package:note_apps/features/home/home_view_model.dart';
import 'package:note_apps/features/home/views/counter_button_view.dart';
import 'package:note_apps/features/home/views/counter_view.dart';
import 'package:note_apps/features/home/views/logout_button_view.dart';
import 'package:note_apps/features/home/views/token_view.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _debouncer;
  String? searchDoa;

  void _onSearchChanged(String value) {
    if (_debouncer?.isActive ?? false) {
      _debouncer?.cancel();
    }
    _debouncer = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        searchDoa = value;
      });
    });
  }

  Future<List<Map<String, dynamic>>> getDoaAPi(String search) async {
    Uri uri = Uri.https(
      "doa-doa-api-ahmadramadhan.fly.dev",
      search.isEmpty ? "/api" : "/api/doa/$search",
    );
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      if (data is List) {
        return data.cast<Map<String, dynamic>>();
      } else if (data is Map) {
        return [data].cast<Map<String, dynamic>>();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    HomeViewModel.register();
  }

  @override
  void dispose() {
    super.dispose();
    HomeViewModel.unregister();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page : ${widget.username}'),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      drawer: drawerList(context, username: widget.username),
      body: ListView(
        children: [
          Column(
            children: [
              TokenView(username: widget.username),
              LogoutButtonView(),
            ],
          ),
          Container(
            child: Column(
              children: [
                CounterView(),
                CounterButtonView(),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () => HomeViewModel().incrementCounter(),
            child: Text('List Doa Doa'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              leading: Icon(Icons.search),
              onChanged: _onSearchChanged,
              hintText: "Search Doa Ex: belajar",
            ),
          ),
          Container(
            child: FutureBuilder(
              future: getDoaAPi(searchDoa ?? ''),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(),
                        child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Column(
                    children: buildListDoa(
                      snapshot.data as List<Map<String, dynamic>>,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildListDoa(List<Map<String, dynamic>> datas) {
    List<Widget> widgets = [];
    for (int i = 0; i < datas.length.toInt(); i++) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 165, 245, 185),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(datas[i]['id'].toString()),
              ),
              title: Text(datas[i]["doa"]),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(datas[i]["ayat"])),
                  Text(datas[i]["latin"]),
                  Text(
                    datas[i]["artinya"],
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            )),
      ));
      widgets.add(SizedBox(
        height: 10,
      ));
    }
    return widgets;
  }
}
