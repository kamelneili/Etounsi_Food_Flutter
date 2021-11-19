import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  Promo({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
  @override
  List<Object?> get props => [id, title, imageUrl, description];
  static List<Promo> promos = [
    Promo(
      description:
          'Place an order of\$10 or more and the delivery fee is on us',
      id: 1,
      title: 'free delivery on your first 3 orders',
      imageUrl:
          'https://images.unsplash.com/photo-1634046387041-db02e878d22b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80',
    ),
    Promo(
      description:
          'Place an order of\$10 or more and the delivery fee is on us',
      id: 2,
      title: 'free delivery on your first 3 orders',
      imageUrl:
          'https://images.unsplash.com/photo-1634046387041-db02e878d22b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80',
    ),
  ];
}
