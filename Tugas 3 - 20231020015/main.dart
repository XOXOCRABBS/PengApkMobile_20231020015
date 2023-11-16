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
    var url = Uri.parse('http://192.168.56.1/restapi2/list.php');
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
    getData();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("My Aplikasi"),),
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
      padding: const EdgeInsets.fromLTRB(10,5,10,5),
      // ignore: unnecessary_null_comparison
      itemCount: list == null?0:list.length,
      itemBuilder: (ctx,i){
        return ListTile(
          shape: BeveledRectangleBorder(
            side: BorderSide(color: Colors.greenAccent,width: 1),
            borderRadius: BorderRadius.circular(15)
          ),
          leading: Text(list[i]['id']),
          title: Text("Nama : " + list[i]['nama']),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Address : " + list[i]['address']),
              Text("Salary : " + list[i]['salary'])
            ],
          ), 
          trailing: MaterialButton(
            child: const Text("Detail"),
            color: Colors.amber,
            onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Details(list:list, index:i)),
          //Text(list[i]['address']),
          //onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Details(list:list, index:i)
            )
          ),
        );
      }
    );
  }
}