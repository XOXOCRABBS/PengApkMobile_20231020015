import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:latihancrud2/main.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  final List list;
  final int index;
  
  const Edit({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController title;
  late TextEditingController content;
  late TextEditingController salary;

  void editData(){
    var url = Uri.parse('http://192.168.56.1/restapi2/update.php'); //update api calling
    http.post(url, body: {'id':widget.list[widget.index]['id'],'nama': title.text,'address':content.text, 'salary':salary.text});
  }

  @override
  void initState() {
    title = TextEditingController(text: widget.list[widget.index]['nama']); //setting up the existing values in textediting control
    content = TextEditingController(text: widget.list[widget.index]['address']);
    salary = TextEditingController(text: widget.list[widget.index]['salary']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Center(child: Text("Edit Data ${widget.list[widget.index]['nama']}"),),
        shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:
        Radius.circular(20))
        ),
        ),
        body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
              child: TextFormField(
              controller: title,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Title',
                hintText: 'Enter Title',
                prefixIcon: IconButton(
                onPressed: null,
                icon: Icon(Icons.title),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              maxLines: 5,
              controller: content,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Address',
                hintText: 'Enter Address',
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.text_snippet_outlined),
                ),
              ),
            ),
          ),
                    Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              maxLines: 5,
              controller: salary,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Salary',
                hintText: 'Enter Salary',
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.text_snippet_outlined),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              child: const Text("Edit Data"),
              color: Colors.amber,
              onPressed: (){
                editData();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context)=>const Home()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
