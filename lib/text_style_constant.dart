import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleConstant {
  static final TextStyle basePoppins = GoogleFonts.poppins();

  static final TextStyle poppinsStyle1 = basePoppins.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static final TextStyle poppinsStyle2 = basePoppins.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
}
