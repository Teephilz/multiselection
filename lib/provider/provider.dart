import 'package:flutter/material.dart';

import '../model/model.dart';
class UserProvider with ChangeNotifier{
  List<UserModel>userlist=[
    UserModel(name: "Taiwo", phoneNumber:"08104083439", icon: Icons.person_pin),
    UserModel(name: "Kehinde", phoneNumber:"09036525460", icon: Icons.person_pin),
    UserModel(name: "Seun", phoneNumber:"08132000923", icon: Icons.person_pin),
    UserModel(name: "Remi", phoneNumber:"08100455880", icon: Icons.person_pin),

  ];

  List<UserModel>get getUserlist {
    return userlist;

  }

  int get getUserListLength{
    return userlist.length;
  }
  List<UserModel>selectedUserlist=[];

  List<UserModel>get getSelectedUserlist {
    return selectedUserlist;
  }

  int get getSelectedUserListLength{
    return selectedUserlist.length;
  }

  void toggleSelection(UserModel model){
    final isExist= selectedUserlist.contains(model);
    if(isExist){
      selectedUserlist.remove(model);

    }
    else{
      selectedUserlist.add(model);
    }
    notifyListeners();
  }

  bool isExist(UserModel model){
    final isExist= selectedUserlist.contains(model);
    return isExist;
}

  void clearSelection(){
   selectedUserlist=[];
   notifyListeners();
  }
}