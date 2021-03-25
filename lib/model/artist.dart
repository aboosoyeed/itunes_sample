class Artist{
  String artistName;
  num artistId;

  Artist(Map json):
      artistName = json['artistName'],
      artistId = json['artistId'];

}