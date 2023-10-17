import 'package:flutter/material.dart';
import 'package:flutter_pengenalan/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(){
  runApp(MaterialApp(
    home: MyApp()
  ));
}

class MyApp extends StatefulWidget{

  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  List<Map<String, dynamic>> data = [];

  final String apiUrl = "http://192.168.100.6/list.php";
  Future<List<Map<String, dynamic>>> _fetchData() async {
    var result = await http.get(Uri.parse(apiUrl));
    print("halo");
    if (result.statusCode == 200){
      print("Success");
      //print(json.decode(result.body).cast<Map<String, dynamic>>().toList());
      //return json.decode(result.body).cast<Map<String, dynamic>>().toList();
      String cleanedResponse = result.body.replaceAll('\uFEFF', '').trim(); 
      print(List<Map<String, dynamic>>.from(json.decode(cleanedResponse)));
      return List<Map<String, dynamic>>.from(json.decode(cleanedResponse)); 
    } else {
      throw Exception("Failed to Load Data");
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BELAJAR RESTFUL API", textDirection: TextDirection.ltr),
      ),
      body: Container(
        child: FutureBuilder<List<Map<String,dynamic>>>(
          future: _fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData){
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  print(snapshot.data[index]);
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: 
                        NetworkImage(snapshot.data[index]['Avatar']),
                    ),
                    title: Text(snapshot.data[index]['First name'] + " " + snapshot.data[index]['Last name']),
                    subtitle: Text(snapshot.data[index]['Produk']),
                  );
                });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }  
}
  

