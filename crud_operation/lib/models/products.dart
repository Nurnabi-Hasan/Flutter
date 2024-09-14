class Products {
  final String id;
  final String productName;
  final String productCode;
  final String createdDate;
  final String img;
  final String qty;
  final String unitPrice;
  final String TotalPrice;

  Products(
      {required this.id,
        required this.productName,
        required this.productCode,
        required this.createdDate,
        required this.img,
        required this.qty,
        required this.unitPrice,
        required this.TotalPrice});
}
