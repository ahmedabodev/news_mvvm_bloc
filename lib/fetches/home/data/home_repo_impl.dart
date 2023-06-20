import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_mvvm_bloc_cubit/core/api/dio_helper.dart';
import 'package:news_mvvm_bloc_cubit/core/api/end_points.dart';
import 'package:news_mvvm_bloc_cubit/core/errors/errors.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/data/home_repo.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view_model/homemodel.dart';

class HomeRepoImpl implements HomeRepo{
  @override
  Future<Either<Failure, HomeModel>> fetchEverything({
    String? query
})async {
    try{
      var data= await DioHelper.getData(url: EndPoints.everything,query: {
        'apiKey':EndPoints.apikey,
        'q':query,

      });
      var home=HomeModel.fromJson(data.data);
      return right(home);


    }catch(e){
      if(e is DioError){
        print(ServerFailure.fromDioError(e).errMessage);

        return left(ServerFailure.fromDioError(e));

      }
      else{
        return left(ServerFailure(e.toString()));

      }

    }
  }
}