import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var valuemain = "3";

  Future<void> setCountry(String valuearg) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString("country", valuearg);
  }

  Future<void> getCountry() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      valuemain = prefs.getString('country') ?? "3";
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getCountry();
    });
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
        onChanged: (value) async {
          await setCountry(value);
          setState(() {
            valuemain = value;
          });
        },
        value: valuemain,
      ),
    );
  }
}
