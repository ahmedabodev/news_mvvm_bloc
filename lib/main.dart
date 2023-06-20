import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/core/api/dio_helper.dart';
import 'package:news_mvvm_bloc_cubit/fetches/category/data/category_repo_impl.dart';
import 'package:news_mvvm_bloc_cubit/fetches/category/presentaion/view_model/category_cubit.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/data/home_repo_impl.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view_model/home_cubit.dart';
import 'package:news_mvvm_bloc_cubit/fetches/main_screen/presentation/view_model/cubit_bottom_bar_cubit.dart';

import 'config/routes/app_routs.dart';
import 'fetches/main_screen/presentation/view/main_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => BottomBarCubit(),),
        BlocProvider(create: (BuildContext context) => CategoryCubit(CategoryRepoImpl()),lazy: false),
          BlocProvider(create: (BuildContext context) => HomeCubit(HomeRepoImpl()),lazy: false),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainView(),
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}

