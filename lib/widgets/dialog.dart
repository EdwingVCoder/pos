import 'package:flutter/material.dart';

Widget textField(TextEditingController controller, String hint,
    {bool? readOnly}) {
  return TextField(
    controller: controller,
    readOnly: readOnly ?? false,
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    ),
    onChanged: (value) => controller.text = value,
  );
}

Widget dataDisplay(IconData icon, String label, String value) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(child: Icon(icon)),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            child: Text(
              value,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      Text(label),
    ],
  );
}

Widget dialogButton(String text, void Function()? onTap) {
  return FilledButton(
    onPressed: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    ),
  );
}
