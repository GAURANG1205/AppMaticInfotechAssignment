import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import '../../Models/ProductModel.dart';
import '../State/ProductState.dart';


class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final products = data.map((e) => ProductModel.fromJson(e)).toList();
        emit(ProductLoaded(products));
      } else {
        emit(ProductError("Failed to load products. (${response.statusCode})"));
      }
    } catch (e) {
      emit(ProductError("An error occurred: ${e.toString()}"));
    }
  }
}
