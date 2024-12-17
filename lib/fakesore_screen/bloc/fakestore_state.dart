import 'package:equatable/equatable.dart';
import 'package:fakestore_flutter_bloc/fakesore_screen/model/fakestore_model.dart';

class FakestoreState extends Equatable {
  const FakestoreState();

  @override
  List<Object> get props => [];
}

final class FakestoreInitial extends FakestoreState {}

final class FakestoreLoadingState extends FakestoreState {}

// ignore: must_be_immutable
final class FakestoreSuccessState extends FakestoreState {
  List<ProductsModel> productsList;
  FakestoreSuccessState({required this.productsList});
  @override
  List<Object> get props => [productsList];
}

final class FakestoreFailedState extends FakestoreState {}

final class FakestoreExceptionState extends FakestoreState {}
