import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/coffee_model.dart';

class CoffeeItem extends StatelessWidget {
  final CoffeeModel item;

  const CoffeeItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/${item.image}',
          width: 166.0,
          height: 166.0,
        ),
        Text(
          item.text,
          style: GoogleFonts.nunito(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.brown,
          ),
        ),
      ],
    );
  }
}