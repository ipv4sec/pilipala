class MemberInfoModel {
  MemberInfoModel({
    this.mid,
    this.name,
    this.sex,
    this.face,
    this.sign,
    this.level,
    this.isFollowed,
    this.topPhoto,
    this.official,
    this.vip,
  });

  int? mid;
  String? name;
  String? sex;
  String? face;
  String? sign;
  int? level;
  bool? isFollowed;
  String? topPhoto;
  Map? official;
  Vip? vip;

  MemberInfoModel.fromJson(Map<String, dynamic> json) {
    mid = json['mid'];
    name = json['name'];
    sex = json['sex'];
    face = json['face'];
    sign = json['sign'] == '' ? '该用户还没有签名' : json['sign'].replaceAll('\n', '');
    level = json['level'];
    isFollowed = json['is_followed'];
    topPhoto = json['top_photo'];
    official = json['official'];
    vip = Vip.fromJson(json['vip']);
  }
}

class Vip {
  Vip({
    this.type,
    this.status,
    this.dueDate,
    this.label,
    this.nicknameColor,
  });

  int? type;
  int? status;
  int? dueDate;
  Map? label;
  int? nicknameColor;

  Vip.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    status = json['status'];
    dueDate = json['due_date'];
    label = json['label'];
    nicknameColor = json['nickname_color'] == ''
        ? null
        : int.parse("0xFF${json['nickname_color'].replaceAll('#', '')}");
  }
}
