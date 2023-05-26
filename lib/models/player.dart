class Player {
  final String nickname;
  final String socketID;
  final double points;
  final String playerType;
  double? left;
  double? top;
  int? score;
  int? playerNo;
  bool? isMe;

  Player({
    required this.nickname,
    required this.socketID,
    required this.points,
    required this.playerType,
    this.left,
    this.top,
    this.score,
    this.playerNo,
    this.isMe,
  });

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'socketID': socketID,
      'points': points,
      'playerType': playerType,
      'left':left,
      'top':top,
      'score':score,
      'playerNo':playerNo,
      'isMe': isMe,
    };
  }


  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'socketID': socketID,
      'points': points,
      'playerType': playerType,
      'left':left,
      'top':top,
      'score':score,
      'playerNo':playerNo,
      'isMe': isMe,
    };
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      socketID: json['socketID'],
      nickname: json['nickname'],
      playerType: json['playerType'],
      points:  json['points'],
      isMe:json['isMe'],
    );
  }


  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickname'] ?? '',
      socketID: map['socketID'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      playerType: map['playerType'] ?? '',
      left: map['left'] ?? 300,
      top: map['top'] ?? 500,
      score: map['score'] ?? 0,
      playerNo: map['playerNo'] ?? 1,
      isMe: map['isMe'] ?? false,

    );
  }

  Player copyWith({
    String? nickname,
    String? socketID,
    double? points,
    String? playerType,
    double? left,
    double? top,
    int? score,
    int? playerNo,
    bool? isMe,
  }) {
    return Player(
      nickname: nickname ?? this.nickname,
      socketID: socketID ?? this.socketID,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
      left: left ?? this.left,
      top: top ?? this.top,
      score: score ?? this.score,
      playerNo: playerNo ?? this.playerNo,
      isMe: isMe ?? this.isMe,
    );
  }
}







Player samplePlayer = Player(
  nickname: 'Mohamed',
  left: 300,
  top: 500,
  score: 0,
  playerNo: 1,
  socketID: '',
  points: 0,
  playerType: '',
  isMe: true,
);


Player samplePlayer2 = Player(
  nickname: 'Nada',
  left: 300,
  top: 500,
  score: 0,
  playerNo: 1,
  socketID: '',
  points: 0,
  playerType: '',
  isMe: false,
);

Player samplePlayer3 = Player(
  nickname: 'Anas',
  left: 300,
  top: 500,
  score: 0,
  playerNo: 1,
  socketID: '',
  points: 0,
  playerType: '',
  isMe: false,
);






