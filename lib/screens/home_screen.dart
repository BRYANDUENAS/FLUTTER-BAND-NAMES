import 'dart:io';
import 'package:band_names_app/models/band_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <BandModel> bands= [
    BandModel(id: '1', name: 'Mago de Oz', votes: 5),
    BandModel(id: '2', name: 'Cnco', votes: 4),
    BandModel(id: '3', name: 'Audioslave', votes: 11),
    BandModel(id: '4', name: 'Imagine Dragons', votes: 6)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bands Names', style: TextStyle(color: Colors.black87),),backgroundColor: Colors.white),
      body: ListView.builder(
        itemCount:bands.length,
        itemBuilder:(context, index) => Dismissible(
          key: Key(bands[index].id),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) => print ('Se borro la banda${bands[index].name} con id ${bands[index].id}'),
          background: Container(
            padding: const EdgeInsets.only(left: 8.0),
            color: Colors.red,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Delete Band', style: TextStyle(color: Colors.white),),
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.blue[100],child:Text(bands[index].name.substring(0,2)),),
            title: Text(bands[index].name),
            trailing: Text(bands[index].votes.toString()),
            onTap: (){ print(bands[index].name);},
          ),
        ), 
      ),
      floatingActionButton: FloatingActionButton(elevation: 1,onPressed:addNewBand,child: const Icon(Icons.add_outlined),),
    );
  }

  addNewBand(){
    final TextEditingController textEditingController = TextEditingController();
    if (Platform.isAndroid){
      return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Band Name'),
        content: TextField(
          controller: textEditingController,
        ),
        actions: [          
          MaterialButton(
            elevation: 5,
            textColor: Colors.blue,
            onPressed: (){
              addBandToList(textEditingController.text);
            },
            child: const Text('Add'),
          )
        ]
      ),
    );
  }
  showCupertinoDialog(
    context: context, 
    builder: (_) => CupertinoAlertDialog(
      title:const Text('New Band Name'),
      content: CupertinoTextField(
        controller: textEditingController,
      ),  
      actions: [
        CupertinoDialogAction(isDefaultAction: true, child: const Text('Add'), onPressed: () => addBandToList(textEditingController.text),),
        CupertinoDialogAction(isDefaultAction: true, child: const Text('Dismiss'), onPressed: () =>Navigator.pop(context),)
      ],
    ),
  );
    
  }

  void addBandToList(String name){
    if (name.length>1){
      bands.add(BandModel(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}