import 'package:dartz/dartz.dart';
import '../../core/failure/failures.dart';
import '../../domain/entities/category_data_entity.dart';
import '../../domain/repository/category_repository.dart';

class CategoryUseCase {

  final CategoryRepository categoryRepository;
  CategoryUseCase(this.categoryRepository);

  Future<Either<Failure, List<CategoryDataEntity>>> execute() async {
    return await categoryRepository.getCategory();
  }
}