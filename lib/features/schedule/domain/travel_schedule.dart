import 'place.dart';
import 'transportation_method.dart';

class TravelSchedule {
  const TravelSchedule({
    required this.id,
    required this.title,
    required this.departure,
    required this.destination,
    required this.startAt,
    required this.transportationMethod,
    required this.createdAt,
    this.groupId,
    this.isAiGenerated = false,
  });

  final String id;
  final String title;
  final Place departure;
  final Place destination;
  final DateTime startAt;
  final TransportationMethod transportationMethod;
  final DateTime createdAt;
  final String? groupId;
  final bool isAiGenerated;

  Map<String, Object?> toJson() => {
    'id': id,
    'title': title,
    'departure': departure.toJson(),
    'destination': destination.toJson(),
    'startAt': startAt.toIso8601String(),
    'transportationMethod': transportationMethod.name,
    'createdAt': createdAt.toIso8601String(),
    'groupId': groupId,
    'isAiGenerated': isAiGenerated,
  };

  factory TravelSchedule.fromJson(Map<String, Object?> json) {
    return TravelSchedule(
      id: json['id']! as String,
      title: json['title']! as String,
      departure: Place.fromJson(
        Map<String, Object?>.from(json['departure']! as Map),
      ),
      destination: Place.fromJson(
        Map<String, Object?>.from(json['destination']! as Map),
      ),
      startAt: DateTime.parse(json['startAt']! as String),
      transportationMethod: TransportationMethod.values.byName(
        json['transportationMethod']! as String,
      ),
      createdAt: DateTime.parse(json['createdAt']! as String),
      groupId: json['groupId'] as String?,
      isAiGenerated: (json['isAiGenerated'] as bool?) ?? false,
    );
  }
}
