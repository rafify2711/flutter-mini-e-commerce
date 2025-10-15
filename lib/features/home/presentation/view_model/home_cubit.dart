  import 'package:flutter_task/features/home/domain/use_cases/get_categories_use_case.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
  import '../../../../core/utils/location_service.dart';
import '../../../../core/utils/request_state.dart';
  import '../../domain/use_cases/get_products_use_case.dart';
  import 'home_states.dart';

@injectable
  class HomeCubit extends Cubit<HomeState> {
    final GetProductsUseCase getProductsUseCase;
    final GetCategoriesUseCase getCategoriesUseCase;

    HomeCubit(this.getProductsUseCase, this.getCategoriesUseCase)
        : super(HomeState());

    void fetchProducts() async {
      emit(state.copyWith(productsState: RequestState.loading));

      final result = await getProductsUseCase();
      result.fold(
            (failure) =>
            emit(
              state.copyWith(
                productsState: RequestState.error,
                errorMessage: failure.errorMessage,
              ),
            ),
            (products) =>
            emit(
              state.copyWith(
                productsState: RequestState.loaded,
                products: products,
              ),
            ),
      );
    }

    void fetchCategories() async {
      emit(state.copyWith(categoriesState: RequestState.loading));

      final result = await getCategoriesUseCase();
      result.fold(
            (failure) =>
            emit(
              state.copyWith(
                categoriesState: RequestState.error,
                errorMessage: failure.errorMessage,
              ),
            ),
            (categories) =>
            emit(
              state.copyWith(
                categoriesState: RequestState.loaded,
                categories: categories,
              ),
            ),
      );
    }

    Future<void> detectLocation() async {
      emit(state.copyWith(locationState: RequestState.loading));
      try {
        final placeName = await LocationService.getCurrentLocationName();

        emit(state.copyWith(
          locationState: RequestState.loaded,
          locationName: placeName,
        ));
      } catch (e) {
        emit(state.copyWith(
          locationState: RequestState.error,
          errorMessage: 'Location unavailable',
        ));
      }
    }
  }
