class Place {
  const Place({
    required this.name,
    this.address,
    this.latitude,
    this.longitude,
  });

  final String name;
  final String? address;
  final double? latitude;
  final double? longitude;

  Map<String, Object?> toJson() => {
    'name': name,
    'address': address,
    'latitude': latitude,
    'longitude': longitude,
  };

  factory Place.fromJson(Map<String, Object?> json) => Place(
    name: json['name']! as String,
    address: json['address'] as String?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
  );
}
