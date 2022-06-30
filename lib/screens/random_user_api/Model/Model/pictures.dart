class Picture {
  Picture({
    required this.small,
    required this.medium,
    required this.thumbnail,
  });

  Picture.fromMap(Map<String, dynamic> map) {
    small:
    map['small'];
    medium:
    map['medium'];
    thumbnail:
    map['thumbnail'];
  }

  String? medium;
  String? small;
  String? thumbnail;

  Map<String, dynamic> toMap() {
    return {
      'small': small,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }
}
