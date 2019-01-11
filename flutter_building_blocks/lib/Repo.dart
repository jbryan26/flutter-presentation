class Repo {
  final String name;
  final String description;

  Repo({this.name, this.description});

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
        name: json['name'] == null ? "defaultName" : json['name'],
        description: json['description'] == null
            ? "defaultDescription"
            : json['description']);
  }
}
