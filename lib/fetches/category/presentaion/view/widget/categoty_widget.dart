import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_mvvm_bloc_cubit/core/widget/data_widget.dart';
import 'package:news_mvvm_bloc_cubit/fetches/category/data/category_repo_impl.dart';
import 'package:news_mvvm_bloc_cubit/fetches/category/presentaion/view_model/category_cubit.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/data/home_repo_impl.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view_model/home_cubit.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  void initState() {
    CategoryCubit.get(context).getData();

    super.initState();
  }
  Widget build(BuildContext context) {
    return   BlocBuilder<CategoryCubit,CategoryState>(builder: (BuildContext context, state) {
      if(state is CategorySuccessLoadedState) {
        return Expanded(
          child: GridView.builder(
            itemCount: CategoryCubit.get(context).home!.arc.length,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ), itemBuilder: (BuildContext context, int index) {
            var home=CategoryCubit.get(context).home!.arc[index];

            return DataWidget(
              title: home.title,
              author: home.author,
              image: home.urlToImage,
              publishedAt:home.publishedAt.substring(0, 10).toString(),
            );


          }, ),
        );
      }
      else if (state is CategoryErrorState){
        return  Center(child: Text(state.message));
      }
      else if (state is CategoryLoadingState){
        return  const Center(child: CircularProgressIndicator());
      }
      else{
        return const SizedBox();
      }
    },);
  }
}
