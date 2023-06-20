import 'package:flutter/material.dart';

import 'view/widget/back_widget.dart';
import 'view/widget/search_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        leading:const BackWidget()
      ),
      body: const SearchWidget(),
    );
  }
}
