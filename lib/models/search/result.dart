import 'package:pilipala/utils/em.dart';
import 'package:pilipala/utils/utils.dart';

class SearchVideoModel {
  SearchVideoModel({this.list});
  List<SearchVideoItemModel>? list;
  SearchVideoModel.fromJson(Map<String, dynamic> json) {
    list = json['result'] == null
        ? []
        : json['result']
            .where((e) => e['available'] == true)
            .map<SearchVideoItemModel>((e) => SearchVideoItemModel.fromJson(e))
            .toList();
  }
}

class SearchVideoItemModel {
  SearchVideoItemModel({
    this.type,
    this.id,
    this.cid,
    // this.author,
    this.mid,
    // this.typeid,
    // this.typename,
    this.arcurl,
    this.aid,
    this.bvid,
    this.title,
    this.titleList,
    this.description,
    this.pic,
    // this.play,
    this.videoReview,
    // this.favorites,
    this.tag,
    // this.review,
    this.pubdate,
    this.senddate,
    this.duration,
    // this.viewType,
    // this.like,
    // this.upic,
    // this.danmaku,
    this.owner,
    this.stat,
    this.rcmdReason,
  });

  String? type;
  int? id;
  int? cid;
  // String? author;
  int? mid;
  // String? typeid;
  // String? typename;
  String? arcurl;
  int? aid;
  String? bvid;
  String? title;
  List? titleList;
  String? description;
  String? pic;
  // String? play;
  int? videoReview;
  // String? favorites;
  String? tag;
  // String? review;
  int? pubdate;
  int? senddate;
  int? duration;
  // String? duration;
  // String? viewType;
  // String? like;
  // String? upic;
  // String? danmaku;
  Owner? owner;
  Stat? stat;
  String? rcmdReason;

  SearchVideoItemModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    arcurl = json['arcurl'];
    aid = json['aid'];
    bvid = json['bvid'];
    mid = json['mid'];
    title = json['title'].replaceAll(RegExp(r'<.*?>'), '');
    // title = Em.regTitle(json['title']);
    titleList = Em.regTitle(json['title']);
    description = json['description'];
    pic = json['pic'] != null && json['pic'].startsWith('//')
        ? 'https:${json['pic']}'
        : json['pic'] ?? '';
    videoReview = json['video_review'];
    pubdate = json['pubdate'];
    senddate = json['senddate'];
    duration = Utils.duration(json['duration']);
    owner = Owner.fromJson(json);
    stat = Stat.fromJson(json);
  }
}

class Stat {
  Stat({
    this.view,
    this.danmaku,
    this.favorite,
    this.reply,
    this.like,
  });

  // 播放量
  int? view;
  // 弹幕数
  int? danmaku;
  // 收藏数
  int? favorite;
  // 评论数
  int? reply;
  // 喜欢
  int? like;

  Stat.fromJson(Map<String, dynamic> json) {
    view = json['play'];
    danmaku = json['danmaku'];
    favorite = json['favorite'];
    reply = json['review'];
    like = json['like'];
  }
}

class Owner {
  Owner({
    this.mid,
    this.name,
    this.face,
  });
  int? mid;
  String? name;
  String? face;

  Owner.fromJson(Map<String, dynamic> json) {
    mid = json["mid"];
    name = json["author"];
    face = json['upic'];
  }
}

class SearchUserModel {
  SearchUserModel({this.list});
  List<SearchUserItemModel>? list;
  SearchUserModel.fromJson(Map<String, dynamic> json) {
    list = json['result']
        .map<SearchUserItemModel>((e) => SearchUserItemModel.fromJson(e))
        .toList();
  }
}

class SearchUserItemModel {
  SearchUserItemModel({
    this.type,
    this.mid,
    this.uname,
    this.usign,
    this.fans,
    this.videos,
    this.upic,
    this.faceNft,
    this.faceNftType,
    this.verifyInfo,
    this.level,
    this.gender,
    this.isUpUser,
    this.roomId,
    this.officialVerify,
  });

  String? type;
  int? mid;
  String? uname;
  String? usign;
  int? fans;
  int? videos;
  String? upic;
  int? faceNft;
  int? faceNftType;
  String? verifyInfo;
  int? level;
  int? gender;
  int? isUpUser;
  int? roomId;
  Map? officialVerify;

  SearchUserItemModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    mid = json['mid'];
    uname = json['uname'];
    usign = json['usign'];
    fans = json['fans'];
    videos = json['videos'];
    upic = 'https:${json['upic']}';
    faceNft = json['face_nft'];
    faceNftType = json['face_nft_type'];
    verifyInfo = json['verify_info'];
    level = json['level'];
    gender = json['gender'];
    isUpUser = json['is_upuser'];
    roomId = json['room_id'];
    officialVerify = json['official_verify'];
  }
}

class SearchArticleModel {
  SearchArticleModel({this.list});

  List<SearchArticleItemModel>? list;

  SearchArticleModel.fromJson(Map<String, dynamic> json) {
    list = json['result'] != null
        ? json['result']
            .map<SearchArticleItemModel>(
                (e) => SearchArticleItemModel.fromJson(e))
            .toList()
        : [];
  }
}

class SearchArticleItemModel {
  SearchArticleItemModel({
    this.pubTime,
    this.like,
    this.title,
    this.subTitle,
    this.rankOffset,
    this.mid,
    this.imageUrls,
    this.id,
    this.categoryId,
    this.view,
    this.reply,
    this.desc,
    this.rankScore,
    this.type,
    this.templateId,
    this.categoryName,
  });

  int? pubTime;
  int? like;
  List? title;
  String? subTitle;
  int? rankOffset;
  int? mid;
  List? imageUrls;
  int? id;
  int? categoryId;
  int? view;
  int? reply;
  String? desc;
  int? rankScore;
  String? type;
  int? templateId;
  String? categoryName;

  SearchArticleItemModel.fromJson(Map<String, dynamic> json) {
    pubTime = json['pub_time'];
    like = json['like'];
    title = Em.regTitle(json['title']);
    subTitle =
        Em.decodeHtmlEntities(json['title'].replaceAll(RegExp(r'<[^>]*>'), ''));
    rankOffset = json['rank_offset'];
    mid = json['mid'];
    imageUrls = json['image_urls'];
    id = json['id'];
    categoryId = json['category_id'];
    view = json['view'];
    reply = json['reply'];
    desc = json['desc'];
    rankScore = json['rank_score'];
    type = json['type'];
    templateId = json['templateId'];
    categoryName = json['category_name'];
  }
}
