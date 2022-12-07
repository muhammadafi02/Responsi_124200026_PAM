import 'package:flutter/material.dart';
import 'package:responsimobile/data_source.dart';
import 'package:responsimobile/matches_model.dart';


class detail extends StatefulWidget {
  const detail({Key? key}) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Match ID ${matchesModel!.id!}"),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),

    );
  }
}

