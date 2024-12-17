import 'package:fakestore_flutter_bloc/fakesore_screen/bloc/fakestore_event.dart';
import 'package:fakestore_flutter_bloc/fakesore_screen/bloc/fakestore_state.dart';
import 'package:fakestore_flutter_bloc/fakesore_screen/model/fakestore_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class FakestoreBloc extends Bloc<FakestoreEvent, FakestoreState> {
  FakestoreBloc() : super(FakestoreInitial()) {
    on<FetchProductsEvents>((event, emit) async {
      final url = Uri.parse("https://fakestoreapi.com/products");
      // loading state
      emit(FakestoreLoadingState());
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          // success state
          emit(FakestoreSuccessState(
              productsList: productsModelFromJson(response.body)));
        } else {
          // api failed state
          emit(FakestoreFailedState());
        }
      } catch (e) {
        // exception state
        emit(FakestoreExceptionState());
      }
    });
  }
}
