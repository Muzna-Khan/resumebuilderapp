import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

TextStyle get appBarTextStyles
{
   return GoogleFonts.montserrat(
     textStyle: TextStyle(
       fontSize: 20,
       fontWeight: FontWeight.bold,
         color: Colors.white
     )

   );


}

TextStyle get headingTextStyles
{
  return GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white
      )

  );


}

TextStyle get subHeadingTextStyles
{
  return GoogleFonts.montserrat(
      textStyle: TextStyle(
          fontSize: 16,
          height: 1.6,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade500
      )
  );
}

TextStyle get labelTextStyles
{
  return GoogleFonts.montserrat(
      textStyle: TextStyle(
          color: Colors.grey.shade500
      )
  );
}

TextStyle get hintTextStyles
{
  return GoogleFonts.montserrat(
      textStyle: TextStyle(


          color: Colors.grey.shade500
      )
  );
}