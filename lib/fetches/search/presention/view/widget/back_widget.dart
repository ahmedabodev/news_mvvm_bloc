import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view_model/home_cubit.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return IconButton(onPressed: () {
          HomeCubit.get(context).changeSearch('bitcoin');
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back));
      },
    );
  }
}
