
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_mvvm_bloc_cubit/core/errors/errors.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/data/home_repo_impl.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view_model/homemodel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  // HomeModel homeModel;
  HomeCubit(this.homeRepoImpl) : super(HomeInitial());
  final HomeRepoImpl homeRepoImpl;
  HomeModel? home;
  static HomeCubit get(context) => BlocProvider.of(context);
  String query='bitcoin';
  changeSearch(value){
    query=value;
    getData();
  }
  void getData()async{
    emit(HomeLoadingState());
    Either<Failure,HomeModel>result= await homeRepoImpl.fetchEverything(query: query);
    result.fold((fail){
      print('ahmed'+fail.toString());
      emit(HomeErrorState(fail.errMessage.toString()));



    }, (respons){
      home=respons;
      print('ahmed'+home.toString());

      emit(HomeSuccessLoadedState());
    });

  }

}
