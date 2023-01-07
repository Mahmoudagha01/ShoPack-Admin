// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopack_admin/core/utilities/params.dart';

import 'package:shopack_admin/data/repositories/orders/orders_repository.dart';

import '../../data/models/all_orders_model.dart';
import '../../data/models/response_model.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersRepository ordersRepository;
  OrdersBloc(
    this.ordersRepository,
  ) : super(OrdersInitial()) {
    on<GetAllOrders>((event, emit) async {
      emit(GetAllOrdersLoadingState());
      final failureOrSuccess = await ordersRepository.getAllOrders(NoParams());
      failureOrSuccess
          .fold((failure) => emit(GetAllOrdersErrorState(failure.message)),
              (success) {
        emit(GetAllOrdersLoadedState(success));
      });
    });
    on<UpdateOrder>((event, emit) async {
      emit(GetAllOrdersLoadingState());
      final failureOrSuccess =
          await ordersRepository.updateOrder(UpdateOrderParams(event.id));
      failureOrSuccess
          .fold((failure) => emit(GetAllOrdersErrorState(failure.message)),
              (success) {
        emit(UpdateOrderLoadedState(success));
        add(GetAllOrders());
      });
    });
  }
}
