// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:clean_arc_task/core/di/register_module.dart' as _i1050;
import 'package:clean_arc_task/features/product/data/datasources/product_remot_datasources.dart'
    as _i318;
import 'package:clean_arc_task/features/product/data/repositories/product_repository_impl.dart'
    as _i254;
import 'package:clean_arc_task/features/product/domain/repositories/product_repository.dart'
    as _i999;
import 'package:clean_arc_task/features/product/domain/usecases/get_product.dart'
    as _i210;
import 'package:clean_arc_task/features/product/presentation/cubit/products_cubit.dart'
    as _i67;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i318.ProductRemoteDatasource>(
      () => _i318.ProductRemoteDatasourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i999.ProductRepository>(
      () => _i254.ProductRepositoryImpl(gh<_i318.ProductRemoteDatasource>()),
    );
    gh.lazySingleton<_i210.GetProducts>(
      () => _i210.GetProducts(gh<_i999.ProductRepository>()),
    );
    gh.factory<_i67.ProductsCubit>(
      () => _i67.ProductsCubit(gh<_i210.GetProducts>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i1050.RegisterModule {}
