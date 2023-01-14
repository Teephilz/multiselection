import 'package:flutter/material.dart';
import 'package:multi_selection/model/model.dart';
import 'package:provider/provider.dart';

import 'provider/provider.dart';
class SelectedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      final provider= Provider.of<UserProvider>(context);
      final selecedlist=provider.getSelectedUserlist;

      return Scaffold(
        appBar: AppBar(
          title: Text("Selected Users"),
          centerTitle: true,
          backgroundColor: Colors.orange,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 500,
              child:selecedlist.isEmpty? Container(
                child: Center(
                    child:
                    Text("No Items Selected")
                ),
              ): ListView.builder(
                  itemCount: provider.getSelectedUserListLength,
                  itemBuilder: (context, int index){
                    return GestureDetector(
                        onTap:(){
                          provider.toggleSelection(selecedlist[index]);
                        },
                        child: UserTile(
                            context,
                            selecedlist[index]));
                  })
            ),

            selecedlist.isEmpty? Container():ElevatedButton(onPressed: (){
              provider.clearSelection();

            }, child: Text("Delete (${provider.getSelectedUserListLength}) users"))
          ],
        ),
      );
    }


    Widget UserTile(BuildContext context, UserModel model){
      final provider= Provider.of<UserProvider>(context);

      return ListTile(
        leading: Icon(model.icon),
        title: Text(model.name.toString()),
        subtitle: Text(model.phoneNumber.toString()),
      );
    }
  }

