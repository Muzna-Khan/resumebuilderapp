import 'package:flutter/cupertino.dart';

import '../styles/text_styles.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.heading, required this.subheading
  });
  final heading;
  final subheading;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading ,style: headingTextStyles,),
        SizedBox(height: 10,),
        Text(subheading , style: subHeadingTextStyles,)

      ],
    );
  }
}
