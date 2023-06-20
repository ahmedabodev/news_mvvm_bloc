import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/core/widget/data_widget.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/data/home_repo_impl.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view/widgets/home_widget.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view_model/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body:HomeWidget(),
    );
  }
}
