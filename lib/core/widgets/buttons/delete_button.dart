import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key, required this.onDelete});

  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 100,
      child: CupertinoButton(
        onPressed: onDelete,
        padding: EdgeInsets.zero,
        minSize: 40,
        child: const Row(
          children: [
            Text(
              'Delete',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF',
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            ),
            SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
