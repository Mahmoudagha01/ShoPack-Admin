import 'package:equatable/equatable.dart';

class AllOrdersModel extends Equatable {
  final bool success;
  final List<AllOrderModel> orders;

  const AllOrdersModel(
    this.success,
    this.orders,
  );
  factory AllOrdersModel.fromJson(Map<String, dynamic> json) => AllOrdersModel(
      json['success'],
      List<AllOrderModel>.from(
          json['orders'].map((x) => AllOrderModel.fromJson(x))));
  @override
  List<Object> get props => [success, orders];
}

class AllOrderModel extends Equatable {
  final ShippingInfoModel shippingInfo;
  final List<OrderItemModel> orderItems;
  final String user;
  final PaymentInfoModel paymentInfo;
  final DateTime paidAt;
  final int itemsPrice;
  final int shippingPrice;
  final int totalPrice;
  final String orderStatus;
  final String id;
  const AllOrderModel(
      this.shippingInfo,
      this.orderItems,
      this.user,
      this.paymentInfo,
      this.paidAt,
      this.itemsPrice,
      this.shippingPrice,
      this.totalPrice,
      this.orderStatus,
      this.id);
  factory AllOrderModel.fromJson(Map<String, dynamic> json) => AllOrderModel(
      ShippingInfoModel.fromJson(json['shippingInfo']),
      List<OrderItemModel>.from(
          json['orderItems'].map((x) => OrderItemModel.fromJson(x))),
      json['user'],
      PaymentInfoModel.fromJson(json['paymentInfo']),
      DateTime.parse(json['paidAt']),
      json['itemsPrice'],
      json['shippingPrice'],
      json['totalPrice'],
      json['orderStatus'],
      json['_id']);
  @override
  List<Object> get props {
    return [
      shippingInfo,
      orderItems,
      user,
      paymentInfo,
      paidAt,
      itemsPrice,
      shippingPrice,
      totalPrice,
      orderStatus,
    ];
  }
}

class ShippingInfoModel extends Equatable {
  final String address;
  final String city;
  final String state;
  final String country;
  final String pincode;
  final String phone;

  const ShippingInfoModel(this.address, this.city, this.state, this.country,
      this.pincode, this.phone);
  factory ShippingInfoModel.fromJson(Map<String, dynamic> json) =>
      ShippingInfoModel(json['address'], json['city'], json['state'],
          json['country'], json['pinCode'], json['phoneNo']);
  @override
  List<Object> get props {
    return [
      address,
      city,
      state,
      country,
      pincode,
      phone,
    ];
  }
}

class OrderItemModel extends Equatable {
  final String name;
  final String image;
  final String id;
  final int price;
  final int quantity;

  const OrderItemModel(
      this.name, this.image, this.id, this.price, this.quantity);
  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
      json['name'],
      json['image'],
      json['_id'],
      json['price'],
      json['quantity']);
  @override
  List<Object> get props {
    return [
      name,
      image,
      id,
      price,
      quantity,
    ];
  }
}

class PaymentInfoModel extends Equatable {
  final String id;
  final String status;

  const PaymentInfoModel(this.id, this.status);
  factory PaymentInfoModel.fromJson(Map<String, dynamic> json) =>
      PaymentInfoModel(json['id'], json['status']);
  @override
  List<Object> get props => [id, status];
}
