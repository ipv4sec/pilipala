// ignore_for_file: constant_identifier_names
enum SearchType {
  // 视频：video
  video,
  // 番剧：media_bangumi（仅用于视频详情页区分番剧播放类型，不用于搜索）
  media_bangumi,
  // 影视：media_ft
  // media_ft,
  // 直播间及主播：live
  // live,
  // 直播间：live_room
  // live_room,
  // 主播：live_user
  // live_user,
  // 话题：topic
  // topic,
  // 用户：bili_user
  bili_user,
  // 专栏：article
  article,
  // 相簿：photo
  // photo
}

// 搜索Tab列表（排除 media_bangumi，仅用于搜索界面）
const List<SearchType> searchTypes = [SearchType.video, SearchType.bili_user, SearchType.article];

extension SearchTypeExtension on SearchType {
  String get type {
    switch (this) {
      case SearchType.video: return 'video';
      case SearchType.media_bangumi: return 'media_bangumi';
      case SearchType.bili_user: return 'bili_user';
      case SearchType.article: return 'article';
    }
  }
  String get label {
    switch (this) {
      case SearchType.video: return '视频';
      case SearchType.media_bangumi: return '番剧';
      case SearchType.bili_user: return '用户';
      case SearchType.article: return '专栏';
    }
  }
}

// 搜索类型为视频时
enum ArchiveFilterType {
  totalrank,
  click,
  pubdate,
  dm,
  stow,
  scores,
  // 专栏
  // attention,
}

extension ArchiveFilterTypeExtension on ArchiveFilterType {
  String get description =>
      ['默认排序', '播放多', '新发布', '弹幕多', '收藏多', '评论多', '最多喜欢'][index];
}

// 搜索类型为专栏时
enum ArticleFilterType {
  // 综合排序
  totalrank,
  // 最新发布
  pubdate,
  // 最多点击
  click,
  // 最多喜欢
  attention,
  // 最多评论
  scores,
}

extension ArticleFilterTypeExtension on ArticleFilterType {
  String get description => ['综合排序', '最新发布', '最多点击', '最多喜欢', '最多评论'][index];
}
