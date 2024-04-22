import 'package:dartz/dartz.dart';
import '../../core/failure/failures.dart';
import '../../domain/entities/sub_category_entity.dart';

abstract class SubCategoryRepository {

  Future<Either<Failure, List<SubCategoryEntity>>> getSubCategory();
}