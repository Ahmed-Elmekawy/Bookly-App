import 'package:bookly/features/home/presentition/views/widgets/best_seller_list_view_item.dart';

class SearchListViewItem extends BestListViewItem {
  const SearchListViewItem(
      {super.key,
      required super.imageUrl,
      required super.title,
      required super.authors,
      required super.averageRating,
      required super.ratingsCount,
      required super.item,
      required super.category});
}
