import 'package:flutter/material.dart';
import 'package:ones_booking/PropetyGenerate/constants.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({Key? key}) : super(key: key);

  @override
  _StateOtpInput createState() => _StateOtpInput();
}

class _StateOtpInput extends State<OtpInput> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 50,
          child: TextFormField(
            autofocus: true,
            style: const TextStyle(fontSize: 24),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: inputDecoration,
            onChanged: (value) => nextField(value, pin2FocusNode),
          ),
        ),
        SizedBox(
          width: 50,
          child: TextFormField(
            focusNode: pin2FocusNode,
            style: const TextStyle(fontSize: 24),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: inputDecoration,
            onChanged: (value) => nextField(value, pin3FocusNode),
          ),
        ),
        SizedBox(
          width: 50,
          child: TextFormField(
            focusNode: pin3FocusNode,
            style: const TextStyle(fontSize: 24),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: inputDecoration,
            onChanged: (value) => nextField(value, pin4FocusNode),
          ),
        ),
        SizedBox(
          width:50,
          child: TextFormField(
            focusNode: pin4FocusNode,
            style:const TextStyle(fontSize: 24),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: inputDecoration,
            onChanged: (value) {
              if (value.length == 1) {
                pin4FocusNode.unfocus();
                // Then you need to check is the code is correct or not
              }
            },
          ),
        )
      ],
    );
  }
}
