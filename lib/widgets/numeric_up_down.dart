import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumericUpDown extends StatefulWidget {
  const NumericUpDown({super.key});

  @override
  State<NumericUpDown> createState() => _NumericUpDownState();
}

class _NumericUpDownState extends State<NumericUpDown> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: _removeFromCounter, icon: const Icon(Icons.remove)),
        Text(
          _counter.toString(),
          style: GoogleFonts.nunito(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            color: Colors.brown,
          ),
        ),
        IconButton(onPressed: _addToCounter, icon: const Icon(Icons.add)),
      ],
    );
  }

  void _addToCounter() {
    setState(() {
      _counter++;
    });
  }

  void _removeFromCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }
}
