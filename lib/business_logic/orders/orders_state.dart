part of 'orders_bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class GetAllOrdersLoadingState extends OrdersState {}

class GetAllOrdersLoadedState extends OrdersState {
  final AllOrdersModel data;

  const GetAllOrdersLoadedState(this.data);
}

class GetAllOrdersErrorState extends OrdersState {
  final String message;

  const GetAllOrdersErrorState(this.message);
}

class UpdateOrderLoadedState extends OrdersState {
  final ResponseModel data;

  const UpdateOrderLoadedState(this.data);
}
