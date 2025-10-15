import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/error_handler.dart';
import '../repo/home_repo.dart';

@injectable
class GetCategoriesUseCase {
  final HomeRepo homeRepo;
  GetCategoriesUseCase(this.homeRepo);

  Future<Either<Failure, List<String>>> call() async {
    return await homeRepo.getCategories();
  }

}