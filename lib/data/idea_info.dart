class IdeaInfo {
  /// PK
  int? id;

  /// 아이디어 작성 제목
  String title;

  /// 아이디어 작성 계기
  String motive;

  /// 아이디어 작성 내용
  String content;

  /// 아이디어 중요도 점수
  int importance;

  /// 유저 피드백
  String? feedback;

  /// 게시글 작성일
  int createdAt;

  IdeaInfo({
    this.id,
    required this.title,
    required this.motive,
    required this.content,
    required this.importance,
    required this.feedback,
    required this.createdAt,
  });

  /// POST
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'motive': motive,
      'content': content,
      'importance': importance,
      'feedback': feedback,
      'createdAt': createdAt,
    };
  }

  /// Data Factory
  factory IdeaInfo.fromMap(Map<String, dynamic> data) {
    return IdeaInfo(
      id: data['id'],
      title: data['title'],
      motive: data['motive'],
      content: data['content'],
      importance: data['importance'],
      feedback: data['feedback'],
      createdAt: data['createdAt'],
    );
  }
}
