part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class GetAllOrders extends OrdersEvent {}

class UpdateOrder extends OrdersEvent {
  final String id;

  const UpdateOrder(this.id);
}
