import '../../../../core/utils/request_state.dart';
import '../../data/models/product.dart';

class HomeState {
  final List<Product>? products;
  final List<String>? categories;
  final RequestState productsState;
  final RequestState categoriesState;
  final RequestState locationState;
  final String? locationName;
  final String? errorMessage;

  HomeState({
    this.products,
    this.categories,
    this.productsState = RequestState.loading,
    this.categoriesState = RequestState.loading,
    this.errorMessage,
    this.locationState = RequestState.loading,
    this.locationName,
  });

  HomeState copyWith({
    List<Product>? products,
    List<String>? categories,
    RequestState? productsState,
    RequestState? categoriesState,
    RequestState? locationState,
    String? locationName,
    String? errorMessage,
  }) {
    return HomeState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      productsState: productsState ?? this.productsState,
      categoriesState: categoriesState ?? this.categoriesState,
      locationState: locationState ?? this.locationState,
      locationName: locationName ?? this.locationName,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
