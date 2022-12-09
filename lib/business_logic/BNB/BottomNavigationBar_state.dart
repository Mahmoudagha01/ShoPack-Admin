// ignore_for_file: overridden_fields

part of 'BottomNavigationBar_bloc.dart';

abstract class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();
  final int index =0;
  @override
  List<Object> get props => [];
}



class DashboardState extends BottomNavigationBarState {

  @override
  final int index = 0;
  final String title = 'Dashboard';

  @override
  List<Object> get props => [index, title];
}

class ProductsState extends BottomNavigationBarState {
  @override
  final int index = 1;
  final String title = 'Products';

  @override
  List<Object> get props => [index, title];
}

class OrdersState extends BottomNavigationBarState {
  @override
  final int index = 2;
  final String title = 'Orders';

  @override
  List<Object> get props => [index, title];
}

class UsersState extends BottomNavigationBarState {
  @override
  final int index = 3;
  final String title = 'Users';

  @override
  List<Object> get props => [index, title];
}

class ReviewState extends BottomNavigationBarState {
  @override
  final int index = 4;
  final String title = 'Reviews';

  @override
  List<Object> get props => [index, title];
}
