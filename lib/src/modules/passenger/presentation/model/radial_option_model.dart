class RadialOptionModel {
  final String asset;
  final String name;
  final String? description;

  RadialOptionModel({
    required this.asset,
    required this.name,
    this.description,
  });

  @override
  String toString() {
    return "RadialOption('$name')";
  }
}
