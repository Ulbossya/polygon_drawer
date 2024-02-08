import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  final VoidCallback onPressed;

  ClearButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 20), 
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 6,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20), 
              child: Text(
                'Нажмите на любую точку экрана, чтобы построить угол',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 6, 
            ),
            Icon(Icons.clear_sharp, color: Colors.grey),
            SizedBox(height: 10), 
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                'Отменить действие',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
