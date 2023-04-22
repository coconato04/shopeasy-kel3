// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:shopeasy/screens/homescreen/komponen/easypay.dart';
import 'package:shopeasy/screens/homescreen/komponen/kate.dart';
import 'package:shopeasy/screens/homescreen/komponen/trio.dart';

class tamp extends StatelessWidget {
  const tamp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900,
      child: Column(
        // Gunakan Column atau ListView sebagai children
        children: [
          const easypay(),
          kate(),
          d(),
        ],
      ),
    );
  }
}
