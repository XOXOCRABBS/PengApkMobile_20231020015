import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'details.dart';
import 'newdata.dart';

void main()=>runApp(MaterialApp(
  title: "API Test",
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.indigo
  ),
  home: const Home(),
));

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List>getData() async{
    var url = Uri.parse('http://192.168.100.4/restapi/list.php');
    final response = await http.post(url);
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("PHP MySQL CRUD"),),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context)=> const NewData(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List> (
        future: getData(),
        builder: (ctx, ss) {
          if(ss.hasError){
            if (kDebugMode) {
              print("error");
            }
          }
          if(ss.hasData){
            return Items(list:ss.data!);
          }
          else{
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class Items extends StatelessWidget {
  List list;
  Items({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ignore: unnecessary_null_comparison
      itemCount: list == null?0:list.length,
      itemBuilder: (ctx,i){
        return ListTile(
          leading: const Icon(Icons.text_snippet_outlined),
          title: Text(list[i]['title']),
          subtitle: Text(list[i]['content']),
          onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Details(list:list, index:i)
            )
          ),
        );
      }
    );
  }
}