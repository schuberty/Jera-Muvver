abstract class RadialOptionBase {
  final String asset;
  final String name;
  final String? description;

  RadialOptionBase({
    required this.asset,
    required this.name,
    this.description,
  });
}
