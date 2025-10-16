// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/cart/data/repo_impl/cart_repo_impl.dart' as _i966;
import '../../features/cart/domain/repo/cart_repo.dart' as _i379;
import '../../features/cart/domain/use_cases/add_product_use_case.dart'
    as _i1063;
import '../../features/cart/domain/use_cases/clear_cart_use_case.dart' as _i493;
import '../../features/cart/domain/use_cases/get_cart_use_case.dart' as _i176;
import '../../features/cart/domain/use_cases/get_total_price_use_case.dart'
    as _i352;
import '../../features/cart/domain/use_cases/remove_product_use_case.dart'
    as _i84;
import '../../features/cart/presentation/view_model/cart_cubit.dart' as _i818;
import '../../features/home/data/data_source/home_data_source.dart' as _i68;
import '../../features/home/data/data_source/home_data_source_impl.dart'
    as _i291;
import '../../features/home/data/repo_impl/home_repo_impl.dart' as _i886;
import '../../features/home/domain/repo/home_repo.dart' as _i280;
import '../../features/home/domain/use_cases/get_categories_use_case.dart'
    as _i495;
import '../../features/home/domain/use_cases/get_products_use_case.dart'
    as _i674;
import '../../features/home/presentation/view_model/home_cubit.dart' as _i940;
import '../api_manger/api_manger.dart' as _i1017;
import '../api_manger/dio_module.dart' as _i508;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i379.CartRepo>(() => _i966.CartRepoImpl());
    gh.factory<_i1063.AddProductUseCase>(
      () => _i1063.AddProductUseCase(gh<_i379.CartRepo>()),
    );
    gh.factory<_i493.ClearCartUseCase>(
      () => _i493.ClearCartUseCase(gh<_i379.CartRepo>()),
    );
    gh.factory<_i176.GetCartUseCase>(
      () => _i176.GetCartUseCase(gh<_i379.CartRepo>()),
    );
    gh.factory<_i352.GetTotalPriceUseCase>(
      () => _i352.GetTotalPriceUseCase(gh<_i379.CartRepo>()),
    );
    gh.factory<_i84.RemoveProductUseCase>(
      () => _i84.RemoveProductUseCase(gh<_i379.CartRepo>()),
    );
    gh.lazySingleton<_i1017.ApiManger>(() => _i1017.ApiManger(gh<_i361.Dio>()));
    gh.factory<_i818.CartCubit>(
      () => _i818.CartCubit(
        gh<_i1063.AddProductUseCase>(),
        gh<_i84.RemoveProductUseCase>(),
        gh<_i493.ClearCartUseCase>(),
        gh<_i176.GetCartUseCase>(),
        gh<_i352.GetTotalPriceUseCase>(),
      ),
    );
    gh.factory<_i68.HomeDataSource>(
      () => _i291.HomeDataSourceImpl(gh<_i1017.ApiManger>()),
    );
    gh.factory<_i280.HomeRepo>(
      () => _i886.HomeRepoImpl(gh<_i68.HomeDataSource>()),
    );
    gh.factory<_i495.GetCategoriesUseCase>(
      () => _i495.GetCategoriesUseCase(gh<_i280.HomeRepo>()),
    );
    gh.factory<_i674.GetProductsUseCase>(
      () => _i674.GetProductsUseCase(gh<_i280.HomeRepo>()),
    );
    gh.factory<_i940.HomeCubit>(
      () => _i940.HomeCubit(
        gh<_i674.GetProductsUseCase>(),
        gh<_i495.GetCategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i508.DioModule {}
