import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAddItem;

  const InputWidget({
    super.key,
    required this.controller,
    required this.onAddItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset('assets/images/bag.png', height: 160),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Digite o item que deseja adicionar',
            hintStyle: TextStyle(color: Color(0xFF8A8A8A)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
            ),
          ),
          onSubmitted: (value) => onAddItem(),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: onAddItem,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: const Text(
            'Salvar item',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
