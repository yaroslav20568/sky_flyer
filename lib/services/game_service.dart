import 'dart:async';

import '../constants/index.dart';
import '../models/index.dart';

class GameService {
  Timer? _gameTimer;
  final Function(Airplane, GameState) onUpdate;
  Airplane _airplane;
  GameState _gameState;

  GameService({
    required this.onUpdate,
    required Airplane initialAirplane,
    required GameState initialGameState,
  }) : _airplane = initialAirplane,
       _gameState = initialGameState;

  void start() {
    _gameState = _gameState.copyWith(status: GameStatus.playing);
    _gameTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (_gameState.status == GameStatus.playing) {
        _airplane.update(GameConstants.gravity);
        _checkBounds();
        onUpdate(_airplane, _gameState);
      }
    });
  }

  void jump() {
    if (_gameState.status == GameStatus.playing) {
      _airplane.jump(GameConstants.jumpVelocity);
    } else if (_gameState.status == GameStatus.waiting) {
      start();
    }
  }

  void _checkBounds() {
    if (_airplane.y < 0 || _airplane.y > 800) {
      _gameState = _gameState.copyWith(status: GameStatus.gameOver);
      stop();
    }
  }

  void stop() {
    _gameTimer?.cancel();
    _gameTimer = null;
  }

  void reset() {
    stop();
    _gameState.reset();
    _airplane = Airplane(x: GameConstants.initialAirplaneX, y: 300.0);
    onUpdate(_airplane, _gameState);
  }

  void dispose() {
    stop();
  }
}
