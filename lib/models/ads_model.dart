class AdsModel{
  final String adsId;
  final String adsUrl;

  AdsModel({required this.adsId, required this.adsUrl});

 factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(
      adsId: json['adsId'],
      adsUrl: json['adsUrl'],
    
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': adsId,
      'adsUrl': adsUrl,
    };
  }
}