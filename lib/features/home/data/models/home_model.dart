class HomeModel {
  String? kind;
  int? totalItems;
  List<Items>? items = [];

  HomeModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }
}

class Items {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  AccessInfo? accessInfo;
  SaleInfo? saleInfo;

  Items.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    saleInfo =
        json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
    accessInfo = json['accessInfo'] != null
        ? AccessInfo.fromJson(json['accessInfo'])
        : null;
    volumeInfo = json['volumeInfo'] != null
        ? VolumeInfo.fromJson(json['volumeInfo'])
        : null;
  }
}

class VolumeInfo {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  String? printType;
  List<String>? categories;
  dynamic averageRating;
  int? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  String? subtitle;

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    authors = json["authors"] == null
        ? []
        : List<String>.from(json["authors"]!.map((x) => x));
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    pageCount = json['pageCount'];
    printType = json['printType'];
    categories = json["categories"] == null
        ? ["programming"]
        : List<String>.from(json["categories"]!.map((x) => x));
    averageRating = json['averageRating'] ?? 0;
    ratingsCount = json['ratingsCount'] ?? 0;
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    imageLinks = json['imageLinks'] != null
        ? ImageLinks.fromJson(json['imageLinks'])
        : null;
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
    subtitle = json['subtitle'];
  }
}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }
}

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  ListPrice? listPrice;
  String? buyLink;

  SaleInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
    listPrice = json['listPrice'] != null
        ? ListPrice.fromJson(json['listPrice'])
        : null;
  }
}

class ListPrice {
  double? amount;
  String? currencyCode;

  ListPrice.fromJson(Map<String, dynamic> json) {
    amount = json['amount']??"Not For Sale";
    currencyCode = json['currencyCode'];
  }
}

class AccessInfo {
  Epub? pdf;
  AccessInfo.fromJson(Map<String, dynamic> json) {
    pdf = json['pdf'] != null ? Epub.fromJson(json['pdf']) : null;
  }
}

class Epub {
  bool? isAvailable;
  String? acsTokenLink;
  String? downloadLink;

  Epub.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
    acsTokenLink = json['acsTokenLink'];
    downloadLink = json['downloadLink'];
  }
}
