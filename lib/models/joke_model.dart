import 'dart:convert';

class JokeModel {
  final String category;
  final String type;
  final String setup;
  final String delivery;
  final String joke;
  JokeModel({
    required this.category,
    required this.type,
    required this.setup,
    required this.delivery,
    required this.joke,
  });

  JokeModel copyWith({
    String? category,
    String? type,
    String? setup,
    String? delivery,
    String? joke,
  }) {
    return JokeModel(
      category: category ?? this.category,
      type: type ?? this.type,
      setup: setup ?? this.setup,
      delivery: delivery ?? this.delivery,
      joke: joke ?? this.joke,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'type': type,
      'setup': setup,
      'delivery': delivery,
      'joke': joke,
    };
  }

  factory JokeModel.fromMap(Map<String, dynamic> map) {
    return JokeModel(
      category: map['category'] ?? '',
      type: map['type'] ?? '',
      setup: map['setup'] ?? '',
      delivery: map['delivery'] ?? '',
      joke: map['joke'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory JokeModel.fromJson(String source) =>
      JokeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'JokeModel(category: $category, type: $type, setup: $setup, delivery: $delivery, joke: $joke)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JokeModel &&
        other.category == category &&
        other.type == type &&
        other.setup == setup &&
        other.delivery == delivery &&
        other.joke == joke;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        type.hashCode ^
        setup.hashCode ^
        delivery.hashCode ^
        joke.hashCode;
  }
}
