

import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses();

  @override
  State<Expenses> createState(){
    return _Expenses();
  }
}

class _Expenses extends State<Expenses>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Travel Expenses"),
    );
  }
}