import 'package:dartz/dartz.dart';
import 'package:news_mvvm_bloc_cubit/core/errors/errors.dart';

import '../../home/presentation/view_model/homemodel.dart';

abstract class CategoryRepo{
  Future<Either<Failure,HomeModel>>fetchCategory();

}