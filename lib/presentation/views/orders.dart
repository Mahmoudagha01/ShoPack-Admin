import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_admin/core/utilities/strings.dart';
import 'package:shopack_admin/presentation/widgets/order_card.dart';
import '../../business_logic/orders/orders_bloc.dart';
import '../widgets/alert_snackbar.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<OrdersBloc, OrdersState>(
          listener: (context, state) {
            if (state is UpdateOrderLoadedState) {
              showSnackbar(state.data.message!, context, Colors.green);
            } else if (state is DeleteOrderLoadedState) {
              showSnackbar(state.data.message!, context, Colors.green);
            }
          },
          builder: (context, state) {
            if (state is GetAllOrdersLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllOrdersLoadedState) {
              return state.data.orders.isNotEmpty
                  ? Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                    child: Text(
                                  "All Orders : ${state.data.orders.length}",
                                  style: Theme.of(context).textTheme.headline6,
                                ))),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.data.orders.length,
                            itemBuilder: (context, index) =>
                                OrderCard(order: state.data.orders[index]),
                          ),
                        ),
                      ],
                    )
                  : const Center(child: Text(AppStrings.noOrders));
            } else if (state is GetAllOrdersErrorState) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
