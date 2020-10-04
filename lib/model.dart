class Country {
  String name;

  Country(this.name);

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name_en'];
  }
}

List<Country> countries = [
  Country('India'),
  Country('United States'),
  Country('Australia'),
  Country('China'),
  Country('Argentina'),
  Country('Canada'),
];

class League {
  String name;
  String facebook;
  String twitter;
  String strBanner;
  String strBadge;
  String strLogo;

  League({
    this.name,
    this.facebook,
    this.twitter,
    this.strBanner,
    this.strBadge,
    this.strLogo,
  });

  League.fromJson(Map<String, dynamic> json) {
    name = json['strLeague'];
    facebook = json['strFacebook'];
    twitter = json['strTwitter'];
    strBanner = json['strBanner'];
    strBadge = json['strBadge'];
    strLogo = json['strLogo'];
  }
}
