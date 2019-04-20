import 'package:flutter/material.dart';
import 'package:forma_flutter_app/views/page_a.dart';

void main(){
  runApp(
    MaterialApp(
      title: 'Forma App',
      home: PageA(),
      debugShowCheckedModeBanner: false,
    ),
  );
}