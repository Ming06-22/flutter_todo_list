import "package:flutter/material.dart";

class CommonDrawer{
  static Drawer getDrawer(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("工作記錄"),
            onTap: (){
              Navigator.pushNamed(context, "/task");
            },
          ),
          ListTile(
            title: const Text("工作數量"),
            onTap: (){
              Navigator.pushNamed(context, "/amount");
            },
          )
        ],
      ),
    );
  }
}