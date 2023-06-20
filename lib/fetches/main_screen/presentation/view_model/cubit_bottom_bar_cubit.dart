import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/fetches/category/presentaion/view/category_view.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view/home_view.dart';


part 'cubit_bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarInitial());
  static BottomBarState get(context) => BlocProvider.of(context);

  List<Widget>screen=[
    const HomeView(),
    const CategoryView(),
  ];

  int index=0;
  void changeIndex(value){
    index=value;
    emit(ChangeIndexState());
  }

}
