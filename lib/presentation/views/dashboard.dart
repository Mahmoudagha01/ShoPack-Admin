import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shopack_admin/business_logic/products/products_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../business_logic/orders/orders_bloc.dart';
import '../../data/models/all_orders_model.dart';
import '../../data/models/all_product_model.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is GetAllProductsLoadedState) {
                  return SfCircularChart(
                    margin: EdgeInsets.zero,
                    title: ChartTitle(
                      text: "Products / Stock chart",
                    ),
                    legend: Legend(
                        textStyle:
                            const TextStyle(overflow: TextOverflow.ellipsis),
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap,
                        height: "20%"),
                    series: <CircularSeries>[
                      DoughnutSeries<AllProductModel, String>(
                        dataSource: state.data.products,
                        xValueMapper: (AllProductModel data, _) =>
                            data.name.split("Sli").first,
                        yValueMapper: (AllProductModel data, _) => data.stock,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
       
          Expanded(
            flex: 2,
            child: BlocBuilder<OrdersBloc, OrdersState>(
              builder: (context, state) {
                if (state is GetAllOrdersLoadedState) {
                  return SfCartesianChart(
                    title: ChartTitle(text:"Orders" ),
                    primaryXAxis: CategoryAxis(arrangeByIndex: true),
                    series: <ChartSeries<AllOrderModel, String>>[
                      SplineSeries<AllOrderModel, String>(
                        dataSource: state.data.orders,
                        color: Colors.blue,
                        
                        xValueMapper: (AllOrderModel f, _) =>
                            DateFormat.yMd().format(f.paidAt).toString(),
                        yValueMapper: (AllOrderModel f, _) => f.totalPrice,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    ));
  }
}
