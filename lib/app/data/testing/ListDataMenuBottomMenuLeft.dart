
final allMenuBottomLeft = <MenuBottomLeft>[
  MenuBottomLeft(Title: "Discount", mIcon: "",Index: 0),
  MenuBottomLeft(Title: "New", mIcon: "assets/icons/New.svg", Index: 1),
  MenuBottomLeft(Title: "Split", mIcon: "assets/icons/Split.svg",Index: 2),
  MenuBottomLeft(Title: "Delete",mIcon: "assets/icons/Delete.svg",Index: 3),
  MenuBottomLeft(Title: "Print",mIcon: "assets/icons/Print.svg",Index: 4),
  MenuBottomLeft(Title: "Drawer", mIcon: "assets/icons/Drawer.svg",Index: 5),
];
class MenuBottomLeft{
  final String Title;
  final String mIcon;
  final int Index;

  const MenuBottomLeft({
    required this.Title,
    required this.mIcon,
    required this.Index,
  });

  MenuBottomLeft copy({
    String? Title,
    String? mIcon,
    int? Index,
  }) =>
      MenuBottomLeft(
        Title: Title ?? this.Title,
        mIcon: mIcon ?? this.mIcon,
        Index: Index ?? this.Index,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MenuBottomLeft &&
              runtimeType == other.runtimeType &&
              Title == other.Title &&
              mIcon == other.mIcon &&
              Index == other.Index;

  @override
  int get hashCode => Title.hashCode ^ mIcon.hashCode ^ Index.hashCode;
}