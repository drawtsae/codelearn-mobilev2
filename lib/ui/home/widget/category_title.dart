import 'package:flutter/cupertino.dart';
import 'package:getwidget/getwidget.dart';

class CategoryTitle extends StatelessWidget {
  final String rightText;
  final String leftText;
  final Function onNavigate;

  const CategoryTitle(
      {Key? key,
      required this.rightText,
      required this.leftText,
      required this.onNavigate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          GFButton(
            onPressed: () => onNavigate(),
            text: rightText,
            type: GFButtonType.outline,
            color: GFColors.INFO,
          ),
        ],
      ),
    );
  }
}
