import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteMessage extends StatelessWidget {
  final VoidCallback onDelete;
  final bool actionAllowed;

  DeleteMessage({required this.actionAllowed, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ElevatedButton(
          child: Text('Eliminar Mensaje'),
          onPressed: actionAllowed ? onDelete : null,
        ),
      ),
    );
  }
}
