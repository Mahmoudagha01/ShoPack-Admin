import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'BottomNavigationBar_event.dart';
part 'BottomNavigationBar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
 
  BottomNavigationBarBloc() : super(DashboardState()) {

    on<LoadDashboard>((event, emit) => emit( DashboardState()));
    on<LoadProducts>((event, emit) => emit( ProductsBtnState()));
    on<LoadOrders>((event, emit) => emit( OrdersState()));
     on<LoadUsers>((event, emit) => emit( UsersState()));
    on<LoadReviews>((event, emit) => emit( ReviewState()));
   
  }
}
