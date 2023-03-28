class CardItemsModel {
  final String bgImage;
  final String title;
  final String subtitle;
  final String amount;
  final String? subAmount;
  final String code;

  CardItemsModel({
    required this.bgImage,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.code,
    this.subAmount,
  });
}
