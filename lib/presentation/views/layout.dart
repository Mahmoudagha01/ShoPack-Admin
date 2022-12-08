import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_admin/presentation/views/Reviews.dart';
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
               
                  break;
                case 1:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadProducts());
                  break;
                case 2:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadOrders());
                  break;
                case 3:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadUsers());
                  break;
                case 4:
                  BlocProvider.of<BottomNavigationBarBloc>(context)
                      .add(LoadReviews());
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.rate_review_outlined),
                  label: 'Reviews',
                  activeIcon: Icon(Icons.rate_review)),
            ],
          ),
          body: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
            builder: (context, state) {
              if (state is DashboardState) {
                return const DashBoardView();
              } else if (state is ProductsState) {
                return const ProductsView();
              } else if (state is OrdersState) {
                return const OrdersView();
              } else if (state is UsersState) {
                return const UsersView();
              } else if (state is ReviewState) {
                return const ReviewsView();
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
