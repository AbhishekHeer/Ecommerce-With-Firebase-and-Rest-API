// ignore_for_file: public_member_api_docs, sort_constructors_first

class list {
  String title;
  String description;
  int price;

  String thumbnail;
  list({
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
  });

  factory list.fromJson(Map<String, dynamic> json) => list(
        title: json["title"],
        description: json["description"],
        price: json["price"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
        "thumbnail": thumbnail,
      };
}
