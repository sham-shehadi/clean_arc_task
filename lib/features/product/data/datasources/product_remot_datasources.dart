import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/product_model.dart';


abstract class ProductRemoteDatasource {
  Future<List<Productmodel>> getProducts();
}

@LazySingleton(as: ProductRemoteDatasource)
class ProductRemoteDatasourceImpl
    implements ProductRemoteDatasource {
  final Dio dio;

  ProductRemoteDatasourceImpl(this.dio);

  @override
  Future<List<Productmodel>> getProducts() async {
    final response = await dio.get(
      ApiEndpoints.getProducts
    );

    if (response.statusCode == 200) {
      final List data = response.data;

      return data.map((json) {
        return Productmodel.fromJson(json);
      }).toList();
    } else {
      throw Exception();
    }
  }
}