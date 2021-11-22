class User {
  final String Name;
  final String VAT;
  final int Qty;
  final String Value;

  const User({
    required this.Name,
    required this.VAT,
    required this.Qty,
    required this.Value,
  });

  User copy({
    String? Name,
    String? VAT,
    int? age,
    String? Value
  }) =>
      User(
        Name: Name ?? this.Name,
        VAT: VAT ?? this.VAT,
        Qty: Qty,
        Value:  Value ?? this.Value,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              Name == other.Name &&
              VAT == other.VAT &&
              Qty == other.Qty &&
              Value == other.Value;

  @override
  int get hashCode => Name.hashCode ^ VAT.hashCode ^ Qty.hashCode ^ Value.hashCode;
}