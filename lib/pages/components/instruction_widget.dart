import 'package:cocktails/constants.dart';
import 'package:flutter/material.dart';

class InstructionWidget extends StatelessWidget{

  const InstructionWidget({Key? key, required this.instructions}) : super(key: key);
  final String instructions;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const Text("Instructions",
            style: kWidgetTitleStyle
        ),
        const SizedBox(height: 30),

        Expanded(child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(instructions),
        )
        ),
      ],
    );
  }
}