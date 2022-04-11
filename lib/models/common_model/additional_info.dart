class AdditionalInfo {
  String? code;
  String? value;

  AdditionalInfo({this.code, this.value});

  AdditionalInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['value'] = this.value;
    return data;
  }
}
