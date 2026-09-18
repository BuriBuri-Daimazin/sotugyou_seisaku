enum TransportationMethod {
  walk,
  bicycle,
  train,
  car;

  String get label => switch (this) {
    walk => '徒歩',
    bicycle => '自転車',
    train => '電車',
    car => '車',
  };
}
