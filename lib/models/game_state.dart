enum GameStatus { waiting, playing, gameOver }

class GameState {
  GameStatus status;
  int score;
  double gameSpeed;

  GameState({
    this.status = GameStatus.waiting,
    this.score = 0,
    this.gameSpeed = 1.0,
  });

  GameState copyWith({GameStatus? status, int? score, double? gameSpeed}) {
    return GameState(
      status: status ?? this.status,
      score: score ?? this.score,
      gameSpeed: gameSpeed ?? this.gameSpeed,
    );
  }

  void reset() {
    status = GameStatus.waiting;
    score = 0;
    gameSpeed = 1.0;
  }
}
