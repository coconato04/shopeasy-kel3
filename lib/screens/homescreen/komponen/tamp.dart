
import 'package:flutter/material.dart';
import 'package:shopeasy/screens/homescreen/komponen/easypay.dart';
import 'package:shopeasy/screens/homescreen/komponen/kate.dart';
import 'package:shopeasy/screens/homescreen/komponen/trio.dart';

class tamp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        // Gunakan Column atau ListView sebagai children
        children: [
          easypay(),
          kate(),
          d(),
        ],
      ),
    );
  }
}
