import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_admin/presentation/widgets/review_card.dart';

import '../../business_logic/products/products_bloc.dart';
import '../../core/utilities/strings.dart';

class ReviewsView extends StatelessWidget {
  final String productId;
  const ReviewsView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(AppStrings.reviews),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            BlocProvider.of<ProductsBloc>(context).add(GetAllProducts());
          },
        ),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is GetReviewsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetReviewsLoadedState) {
            return state.data.reviews.isNotEmpty
                ? ListView.builder(
                    itemCount: state.data.reviews.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ReviewCard(
                            product: state.data.reviews[index],
                            productId: productId),
                      );
                    },
                  )
                :  Center(child: Text(AppStrings.noReviews,style: Theme.of(context).textTheme.headline6,));
          } else if (state is GetReviewsErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
