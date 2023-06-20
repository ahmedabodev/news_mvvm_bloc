import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/fetches/category/data/category_repo_impl.dart';
import 'package:news_mvvm_bloc_cubit/fetches/category/presentaion/view/widget/category_button_widget.dart';
import 'package:news_mvvm_bloc_cubit/fetches/category/presentaion/view/widget/categoty_widget.dart';
import 'package:news_mvvm_bloc_cubit/fetches/category/presentaion/view_model/category_cubit.dart';

import 'widget/country_widget.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CountryWidget(),
          CategoryButtonsWidget(),
          CategoryWidget(),
        ],
      ),
    );
  }
}
