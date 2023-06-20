import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/config/routes/app_routs.dart';
import 'package:news_mvvm_bloc_cubit/fetches/category/presentaion/view_model/category_cubit.dart';
import '../../../home/presentation/view_model/home_cubit.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/main_body.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: IconButton(onPressed: () {
        },

        icon: Image.network('https://cdn-icons-png.flaticon.com/512/681/681803.png',height: 30,width: 30,fit:BoxFit.cover,),
        ),
        title: const Text('Earth News'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, Routes.searchView);
          }, icon: const Icon(Icons.search))
        ],
      ),
      bottomNavigationBar:const BottomBarWidget(),
      body: const MainBodyWidget(),
    );
  }
}

