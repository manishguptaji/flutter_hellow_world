import 'package:flutter/material.dart';

class Pager extends StatefulWidget {
  const Pager({super.key});

  @override
  State<Pager> createState() => _PagerState();
}

class _PagerState extends State<Pager> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('View Pager demo'),
      ),
    ));
  }
}
