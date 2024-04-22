import 'package:dartz/dartz.dart';
import '../../core/failure/failures.dart';
import '../entities/category_data_entity.dart';

abstract class CategoryRepository {

  Future<Either<Failure, List<CategoryDataEntity>>> getCategory();

}