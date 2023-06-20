import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/core/widget/data_widget.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/data/home_repo_impl.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view_model/home_cubit.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    // TODO: implement initState
    HomeCubit.get(context).getData();
    super.initState();
  }
  Widget build(BuildContext context) {
    return   BlocBuilder<HomeCubit,HomeState>(builder: (BuildContext context, state) {
      if(state is HomeSuccessLoadedState) {
        return GridView.builder(
          itemCount: HomeCubit.get(context).home!.arc.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ), itemBuilder: (BuildContext context, int index) {
          var home=HomeCubit.get(context).home!.arc[index];

          return DataWidget(
            title: home.title,
            author: home.author,
            image: home.urlToImage,
            publishedAt:home.publishedAt.substring(0, 10).toString(),
          );


        }, );
      }
      else if (state is HomeErrorState){
        return  Center(child: Text(state.message));
      }
      else if (state is HomeLoadingState){
        return  const Center(child: CircularProgressIndicator());
      }else{
        return const SizedBox();
      }
    },);
  }
}
