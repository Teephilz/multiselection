import 'package:flutter/material.dart';
import 'package:multi_selection/model/model.dart';
import 'package:multi_selection/provider/provider.dart';
import 'package:provider/provider.dart';

import 'selected.dart';
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<UserProvider>(context);
    final userlist= provider.getUserlist;

    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: userlist.length,
          itemBuilder: (context, int index){
            return GestureDetector(
                onTap:(){
                  provider.toggleSelection(userlist[index]);
                },
                child: UserTile(
                    context,
                    userlist[index]));
          }),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectedPage()));
      },
          label: Text("Selected")),
    );
  }


  Widget UserTile(BuildContext context, UserModel model){
    final provider= Provider.of<UserProvider>(context);

    return ListTile(
      leading: Icon(model.icon),
      trailing: provider.isExist(model)? Icon(Icons.check_box_outlined, color: Colors.green,):Icon(Icons.check_box_outline_blank),
      title: Text(model.name.toString()),
      subtitle: Text(model.phoneNumber.toString()),
    );
  }
}
