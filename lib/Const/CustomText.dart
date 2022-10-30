import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  CustomText(
     {
    required this.txt,
    required this.txtSize,
    required this.clr,
    required this.bold,
       this.FontFamily="Poppins"
  });
  String txt;
  double txtSize;
  Color clr;
  bool bold;
  String FontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          color: clr,
          fontSize: txtSize,
          fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
          fontFamily: FontFamily),
      overflow: TextOverflow.ellipsis,
      maxLines: 5,
    );
  }
}
