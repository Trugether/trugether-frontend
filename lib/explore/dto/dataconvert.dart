class SongResponse {
  final bool success;
  final SongData data;

  SongResponse({required this.success, required this.data});

  factory SongResponse.fromJson(Map<String, dynamic> json) {
    return SongResponse(
      success: json['success'],
      data: SongData.fromJson(json['data']),
    );
  }
}

class SongData {
  final int total;
  final int start;
  final List<Song> results;

  SongData({required this.total, required this.start, required this.results});

  factory SongData.fromJson(Map<String, dynamic> json) {
    return SongData(
      total: json['total'],
      start: json['start'],
      results:
          (json['results'] as List<dynamic>)
              .map((item) => Song.fromJson(item))
              .toList(),
    );
  }
}

class Song {
  final String id;
  final String name;
  final String type;
  final String? year;
  final String? releaseDate;
  final double? duration;
  final String? label;
  final bool explicitContent;
  final double? playCount;
  final String language;
  final bool hasLyrics;
  final String? lyricsId;
  final Lyrics? lyrics;
  final String url;
  final String? copyright;
  final Album album;
  final Artists artists;
  final List<ImageData> image;
  final List<DownloadUrl> downloadUrl;

  Song({
    required this.id,
    required this.name,
    required this.type,
    this.year,
    this.releaseDate,
    this.duration,
    this.label,
    required this.explicitContent,
    this.playCount,
    required this.language,
    required this.hasLyrics,
    this.lyricsId,
    this.lyrics,
    required this.url,
    this.copyright,
    required this.album,
    required this.artists,
    required this.image,
    required this.downloadUrl,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      year: json['year'],
      releaseDate: json['releaseDate'],
      duration: json['duration']?.toDouble(),
      label: json['label'],
      explicitContent: json['explicitContent'],
      playCount: json['playCount']?.toDouble(),
      language: json['language'],
      hasLyrics: json['hasLyrics'],
      lyricsId: json['lyricsId'],
      lyrics: json['lyrics'] != null ? Lyrics.fromJson(json['lyrics']) : null,
      url: json['url'],
      copyright: json['copyright'],
      album: Album.fromJson(json['album']),
      artists: Artists.fromJson(json['artists']),
      image:
          (json['image'] as List<dynamic>)
              .map((item) => ImageData.fromJson(item))
              .toList(),
      downloadUrl:
          (json['downloadUrl'] as List<dynamic>)
              .map((item) => DownloadUrl.fromJson(item))
              .toList(),
    );
  }
}

class Lyrics {
  final String lyrics;
  final String copyright;
  final String snippet;

  Lyrics({
    required this.lyrics,
    required this.copyright,
    required this.snippet,
  });

  factory Lyrics.fromJson(Map<String, dynamic> json) {
    return Lyrics(
      lyrics: json['lyrics'],
      copyright: json['copyright'],
      snippet: json['snippet'],
    );
  }
}

class Album {
  final String? id;
  final String? name;
  final String? url;

  Album({this.id, this.name, this.url});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], name: json['name'], url: json['url']);
  }
}

class Artists {
  final List<Artist> primary;
  final List<Artist> featured;
  final List<Artist> all;

  Artists({required this.primary, required this.featured, required this.all});

  factory Artists.fromJson(Map<String, dynamic> json) {
    return Artists(
      primary:
          (json['primary'] as List<dynamic>)
              .map((item) => Artist.fromJson(item))
              .toList(),
      featured:
          (json['featured'] as List<dynamic>)
              .map((item) => Artist.fromJson(item))
              .toList(),
      all:
          (json['all'] as List<dynamic>)
              .map((item) => Artist.fromJson(item))
              .toList(),
    );
  }
}

class Artist {
  final String id;
  final String name;
  final String role;
  final String type;
  final List<ImageData> image;
  final String url;

  Artist({
    required this.id,
    required this.name,
    required this.role,
    required this.type,
    required this.image,
    required this.url,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      type: json['type'],
      image:
          (json['image'] as List<dynamic>)
              .map((item) => ImageData.fromJson(item))
              .toList(),
      url: json['url'],
    );
  }
}

class ImageData {
  final String quality;
  final String url;

  ImageData({required this.quality, required this.url});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(quality: json['quality'], url: json['url']);
  }
}

class DownloadUrl {
  final String quality;
  final String url;

  DownloadUrl({required this.quality, required this.url});

  factory DownloadUrl.fromJson(Map<String, dynamic> json) {
    return DownloadUrl(quality: json['quality'], url: json['url']);
  }
}
