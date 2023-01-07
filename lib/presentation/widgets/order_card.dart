import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../business_logic/orders/orders_bloc.dart';
import '../../core/utilities/strings.dart';
import '../../data/models/all_orders_model.dart';

class OrderCard extends StatelessWidget {
  final AllOrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: kElevationToShadow[6],
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat.yMMMEd().format(order.paidAt),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          )),
                  Text('${order.itemsPrice} \$',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.black,
                          ))
                ],
              ),
              Text(
                "Order ID #${order.id}",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.black,
                    ),
              ),
              Text("Shipping To : ${order.shippingInfo.city}".toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                      )),
              Text("Order Items (${order.orderItems.length}) :",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.blue,
                      )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                child: ListView.builder(
                  itemCount: order.orderItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 8,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      order.orderItems[index].image))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                height: 30,
                                child: Text(
                                  order.orderItems[index].name,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Text(
                                      '${order.orderItems[index].price} \$',
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                  SizedBox(
                                      child: FittedBox(
                                          child: Text(
                                              'Quantity: ${order.orderItems[index].quantity} '))),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  order.orderStatus != "Delivered"
                      ? OutlinedButton.icon(
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () {
                            BlocProvider.of<OrdersBloc>(context)
                                .add(UpdateOrder(order.id));
                          },
                          icon: const Icon(Icons.check),
                          label: const Text(AppStrings.accept),
                        )
                      : Text(
                          '${AppStrings.acepted}  ✔',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.green),
                        ),
                  OutlinedButton.icon(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                       BlocProvider.of<OrdersBloc>(context)
                                .add(DeleteOrder(order.id));
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text(AppStrings.delete),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
