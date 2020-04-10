import 'package:flutter/material.dart';

List<Widget> paddedText(List<String> lines) {
  return lines
        .map((e) => Container(
            child: Text(e),
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft))
        .toList();
}
