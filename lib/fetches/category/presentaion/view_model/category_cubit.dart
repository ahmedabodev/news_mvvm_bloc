import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_mvvm_bloc_cubit/core/errors/errors.dart';
import 'package:news_mvvm_bloc_cubit/fetches/category/data/category_repo_impl.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view_model/homemodel.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepoImpl) : super(CategoryInitial());
  final CategoryRepoImpl categoryRepoImpl;
  HomeModel? home;
  String category='general';
  String country='us';
  int indexCategory=0;
  int indexCountry =0;
  
  List<String>myCategory=[
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'entertainment',
    'technology',
  ];
  List<String>myCountry=[
    'us',
    'eg',
    'jp',
  ];

  void changeIndexCategory(value){
    indexCategory=value;
    getData();
  }
  void changeIndexCountry(value){
    indexCountry=value;
    getData();
  }

  static CategoryCubit get(context) => BlocProvider.of(context);

   void getData()async{
    emit(CategoryLoadingState());
    Either<Failure,HomeModel>result= await categoryRepoImpl.fetchCategory(category: myCategory[indexCategory],country: myCountry[indexCountry]);
    result.fold((fail){
      emit(CategoryErrorState(fail.errMessage.toString()));

    }, (respons){
      home=respons;

      emit(CategorySuccessLoadedState());
    });

  }
}
