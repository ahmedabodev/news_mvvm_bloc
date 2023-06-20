import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view/home_view.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view/widgets/home_widget.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view_model/home_cubit.dart';
import 'package:news_mvvm_bloc_cubit/fetches/search/presention/view/widget/search_feild.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8,),
        SearchTextForm(),
        const SizedBox(height: 8,),
        const Expanded(child: HomeWidget()),
      ],
    );
  }
}
