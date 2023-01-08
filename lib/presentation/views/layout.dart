import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_admin/business_logic/orders/orders_bloc.dart';
import 'package:shopack_admin/business_logic/products/products_bloc.dart';
import 'package:shopack_admin/business_logic/users/user_bloc.dart';
import 'package:shopack_admin/presentation/views/dashboard.dart';
import 'package:shopack_admin/presentation/views/orders.dart';
import 'package:shopack_admin/presentation/views/products.dart';
import 'package:shopack_admin/presentation/views/users.dart';
import '../../business_logic/BNB/BottomNavigationBar_bloc.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context).add(GetAllProducts());
     BlocProvider.of<OrdersBloc>(context).add(GetAllOrders());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: state.index,
            onTap: (index) {
              switch (index) {
                case 0:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadDashboard());
BlocProvider.of<ProductsBloc>(context).add(GetAllProducts());
                  break;
                case 1:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadProducts());
                  BlocProvider.of<ProductsBloc>(context).add(GetAllProducts());
                  break;
                case 2:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadOrders());
                  BlocProvider.of<OrdersBloc>(context).add(GetAllOrders());
                  break;
                case 3:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadUsers());
                  BlocProvider.of<UserBloc>(context).add(GetUsers());
                  break;
                default:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadDashboard());
              }
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_outlined),
                  label: 'Dashboard',
                  activeIcon: Icon(Icons.dashboard)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.create_new_folder_outlined),
                  label: 'Products',
                  activeIcon: Icon(Icons.create_new_folder)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_rounded),
                  label: 'Orders',
                  activeIcon: Icon(Icons.list_alt)),
              BottomNavigationBarItem(
                icon: Icon(Icons.group_outlined),
                label: 'Users',
                activeIcon: Icon(Icons.group),
              ),
            ],
          ),
          body: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
            builder: (context, state) {
              if (state is DashboardState) {
                return const DashBoardView();
              } else if (state is ProductsBtnState) {
                return const ProductsView();
              } else if (state is OrdersBtnState) {
                return const OrdersView();
              } else if (state is UsersState) {
                return const UsersView();
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      },
    );
  }
}
