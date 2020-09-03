class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
	if (reverseMap == null) {
	  reverseMap = map.map((k, v) => new MapEntry(v, k));
	}
	return reverseMap;
  }
}

// LANGUAGE
enum OriginalLanguage { EN, KO, FR, JA }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "fr": OriginalLanguage.FR,
  "ja": OriginalLanguage.JA,
  "ko": OriginalLanguage.KO
});