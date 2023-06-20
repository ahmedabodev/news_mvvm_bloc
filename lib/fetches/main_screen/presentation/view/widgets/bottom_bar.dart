import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/fetches/main_screen/presentation/view_model/cubit_bottom_bar_cubit.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit,BottomBarState>(builder: (BuildContext context, state) {
      return      BottomNavigationBar(
        onTap: (value){
          context.read<BottomBarCubit>().changeIndex(value);
        },
        selectedItemColor: Colors.indigoAccent,
        currentIndex: context.read<BottomBarCubit>().index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              label: 'Category',
              icon: Icon(Icons.category)
          ),
        ],
      );
    },);
  }
}
