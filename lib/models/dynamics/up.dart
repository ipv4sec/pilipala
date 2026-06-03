class FollowUpModel {
  FollowUpModel({
    this.upList,
    this.myInfo,
  });

  List<UpItem>? upList;
  MyInfo? myInfo;

  FollowUpModel.fromJson(Map<String, dynamic> json) {
    upList = json['up_list'] != null
        ? json['up_list'].map<UpItem>((e) => UpItem.fromJson(e)).toList()
        : [];
    myInfo = json['my_info'] != null ? MyInfo.fromJson(json['my_info']) : null;
  }
}

class UpItem {
  UpItem({
    this.face,
    this.hasUpdate,
    this.isReserveRecall,
    this.mid,
    this.uname,
  });

  String? face;
  bool? hasUpdate;
  bool? isReserveRecall;
  int? mid;
  String? uname;
  String type = 'up';

  UpItem.fromJson(Map<String, dynamic> json) {
    face = json['face'];
    hasUpdate = json['has_update'];
    isReserveRecall = json['is_reserve_recall'];
    mid = json['mid'];
    uname = json['uname'];
  }
}

class MyInfo {
  MyInfo({
    this.face,
    this.mid,
    this.name,
  });

  String? face;
  int? mid;
  String? name;

  MyInfo.fromJson(Map<String, dynamic> json) {
    face = json['face'];
    mid = json['mid'];
    name = json['name'];
  }
}
