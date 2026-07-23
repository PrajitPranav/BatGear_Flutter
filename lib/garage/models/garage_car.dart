class GarageCar {
  final String id;
  final String title;
  final String category; // 'sports', 'muscle', 'electric'
  final String imagePath;
  final String description;

  const GarageCar({
    required this.id,
    required this.title,
    required this.category,
    required this.imagePath,
    required this.description,
  });
}
