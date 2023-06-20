import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/fetches/main_screen/presentation/view_model/cubit_bottom_bar_cubit.dart';

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit,BottomBarState>(builder: (BuildContext context, state) {
      return  context.read<BottomBarCubit>().screen[context.read<BottomBarCubit>().index];
    },);
  }
}
