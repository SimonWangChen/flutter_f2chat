class CacheConfig {
  CacheConfig();

  bool enable;
  num maxAge;
  num maxCount;

  CacheConfig.fromJson(Map<String, dynamic> json)
      :enable = json['enable'],
        maxAge = json['maxAge'],
        maxCount = json['maxCount'];

  Map<String, dynamic> toJson() =>
      {
        'enable': enable,
        'maxAge': maxAge,
        'maxCount': maxCount
      };

}
