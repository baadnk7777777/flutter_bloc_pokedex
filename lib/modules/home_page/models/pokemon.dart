class Pokemons {
  String? name;
  String? url;
  String? imageUrl;

  Pokemons({this.name, this.url, this.imageUrl});

  Pokemons.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    imageUrl = _extractIdFromUrl(json['url']);
  }

  String? _extractIdFromUrl(String? url) {
    if (url == null) {
      return null;
    }
    List<String> parts = url.split('/');
    return parts[parts.length - 2];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
