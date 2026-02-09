class Categers {
  String id;

  String description;

  String images;

  Categers({
    required this.id,
    required this.description,
    required this.images,
  });

static List<Categers> getCategories() {
return[
  Categers(id: 'general', description: 'General', images: 'assets/images/general_dark.png'),
  Categers(id: 'business', description: 'Business', images: 'assets/images/busniess_dark.png'),
  Categers(id: 'sports', description: 'Sports', images: 'assets/images/sport_dark.png'),
  Categers(id: 'technology', description: 'Technology', images: 'assets/images/technology_dark.png'),
  Categers(id: 'entertainment', description: 'Entertainment', images: 'assets/images/entertainment_dark.png'),
  Categers(id: 'health', description: 'Health', images: 'assets/images/helth_dark.png'),
  Categers(id: 'science', description: 'Science', images: 'assets/images/science_dark.png'),

];

  }
}
