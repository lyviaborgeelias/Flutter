import 'package:flutter/material.dart';

class MinhaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MinhaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Text("Tela Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        IconButton(onPressed: () => Navigator.pushNamed(context, "/gestao"), icon: Icon(Icons.settings, color: Colors.white))
      ],),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.orange,
    );
  }
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}