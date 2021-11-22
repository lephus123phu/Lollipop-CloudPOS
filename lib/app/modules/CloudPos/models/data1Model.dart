class Data1Model {
  final String ID;
  final String Service;
  final String Time;
  final String Total;

  const Data1Model({
    required this.ID,
    required this.Service,
    required this.Time,
    required this.Total,
  });

  Data1Model copy({
    String? ID,
    String? Service,
    String? Time,
    String? Total
  }) =>
      Data1Model(
        ID: ID ?? this.ID,
        Service: Service ?? this.Service,
        Time: Time ?? this.Time,
        Total:  Total ?? this.Total,
      );
}