enum MarkersIcons {
  hotel,
  shop,
  restaurant,
  education,
  sports,
  park,
}

class MarkersIconsMapper {
  static MarkersIcons toEnum(int index) => MarkersIcons.values[index];
}
