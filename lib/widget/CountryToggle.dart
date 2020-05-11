import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  var _value;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: DropdownButton<String>(
        underline: Text(""),
        // icon: Text(""),
        items: [
          DropdownMenuItem(
            value: "1",
            child: Container(
              height: 20,
              width: 40,
              child: Image.asset('icons/flags/png/es.png',
                  package: 'country_icons'),
            ),
          ),
          DropdownMenuItem(
            value: "2",
            child: Container(
              height: 20,
              width: 40,
              child: Image.asset('icons/flags/png/uy.png',
                  package: 'country_icons'),
            ),
          ),
          DropdownMenuItem(
            value: "3",
            child: Container(
              height: 20,
              width: 40,
              child: Image.asset('icons/flags/png/ar.png',
                  package: 'country_icons'),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
        value: _value,
      ),
    );
  }
}
