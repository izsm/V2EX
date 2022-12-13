
class GlobalInfo {

  // 当前语言
  late String locale;

  GlobalInfo({this.locale = 'en_US'});

  GlobalInfo.fromJson(Map<String, dynamic> json) {
    locale = json['locale'] ?? 'en_US';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locale'] = locale;
    return data;
  }
}