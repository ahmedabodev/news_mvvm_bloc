 import 'package:dartz/dartz.dart';
import 'package:news_mvvm_bloc_cubit/core/errors/errors.dart';
import 'package:news_mvvm_bloc_cubit/fetches/home/presentation/view_model/homemodel.dart';

abstract class HomeRepo {
  Future<Either<Failure,HomeModel>>fetchEverything();
 }