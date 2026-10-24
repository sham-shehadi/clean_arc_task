import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remot_datasources.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;

  ProductRepositoryImpl(this.remoteDatasource);
  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await remoteDatasource.getProducts();
      return Right(products);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'خطأ غير معروف'),);
    } catch (e) {
      return Left(ServerFailure('تعذّر تحميل المنتجات'),);
    }
  }

}