import 'package:dartz/dartz.dart';
import '../../../core/failure/failures.dart';
import '../../../domain/entities/sub_category_entity.dart';
import '../../../domain/repository/sub_category_repository.dart';

class SubCategoryUseCase {
  final SubCategoryRepository subCategoryRepository;

  SubCategoryUseCase(this.subCategoryRepository);

  Future<Either<Failure, List<SubCategoryEntity>>> execute() async {
    return await subCategoryRepository.getSubCategory();
  }
}
