import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import '../../business_logic/products/products_bloc.dart';
import '../../data/models/reviews_model.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel product;
  final String productId;

  const ReviewCard({super.key, required this.product, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 3.9,
        width: MediaQuery.of(context).size.width,
      ),
      Positioned(
        top: 25,
        left: 10,
        right: 10,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4.5,
          child: Card(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBarIndicator(
                      itemSize: 20.0,
                      rating: product.rating!.toDouble(),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      direction: Axis.horizontal,
                    ),
                    Text(
                      DateFormat.yMMMEd().format(product.createdAt!),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                    product.comment!,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          )),
        ),
      ),
      const CircleAvatar(
        backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
      ),
      Positioned(
        top: 3,
        right: 10,
        child: IconButton(
          onPressed: () {
            BlocProvider.of<ProductsBloc>(context)
                .add(DeleteReview(productId,product.id!,));
          },
          icon: const Icon(Icons.delete),
          color: Colors.red,
        ),
      )
    ]);
  }
}
