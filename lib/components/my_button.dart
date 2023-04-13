import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final VoidCallback onPress;
  const MyButton( this.title,  this.color,this.textColor,{Key? key, required  this.onPress,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded
      (
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
              onPressed: onPress,
              child: Text(title,style: TextStyle(color: textColor, fontSize: 20),),
              backgroundColor: color,
            ),
          ),

        height: 80,
        width: 60,
      ),
    );


  }
}