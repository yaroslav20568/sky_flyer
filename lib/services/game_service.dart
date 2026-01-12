import 'dart:async';
import 'dart:math';

import 'package:sky_flyer/constants/index.dart';
import 'package:sky_flyer/models/index.dart';

class GameService {
  Timer? _gameTimer;
  final Function(Airplane, GameState, List<Obstacle>) onUpdate;
  Airplane _airplane;
  GameState _gameState;
  List<Obstacle> _obstacles = [];
  final double _screenWidth;
  final double _screenHeight;
  final Random _random = Random();
  double _nextObstacleX = 0;

  GameService({
    required this.onUpdate,
    required Airplane initialAirplane,
    required GameState initialGameState,
    required double screenWidth,
    required double screenHeight,
  }) : _airplane = initialAirplane,
       _gameState = initialGameState,
       _screenWidth = screenWidth,
       _screenHeight = screenHeight {
    _nextObstacleX = screenWidth;
  }

  void start() {
    _gameState = _gameState.copyWith(status: GameStatus.playing);
    onUpdate(_airplane, _gameState, _obstacles);
    _gameTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (_gameState.status == GameStatus.playing) {
        _airplane.update(GameConstants.gravity);
        _updateObstacles();
        _generateObstacles();
        _checkCollisions();
        _checkBounds();
        _updateScore();
        onUpdate(_airplane, _gameState, _obstacles);
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

  void _updateObstacles() {
    _obstacles = _obstacles.map((obstacle) {
      return obstacle.copyWith(x: obstacle.x - GameConstants.obstacleSpeed);
    }).toList();
    _obstacles.removeWhere((obstacle) => obstacle.isOffScreen(_screenWidth));
  }

  void _generateObstacles() {
    if (_screenWidth <= 0 || _screenHeight <= 0) {
      return;
    }

    if (_obstacles.isEmpty || _obstacles.last.x < _screenWidth - 400) {
      final minTopHeight = 100.0;
      final maxTopHeight = _screenHeight - GameConstants.obstacleGap - 100.0;

      if (maxTopHeight <= minTopHeight) {
        return;
      }

      final topHeight =
          minTopHeight + _random.nextDouble() * (maxTopHeight - minTopHeight);

      final bottomY = topHeight + GameConstants.obstacleGap;
      if (bottomY >= _screenHeight) {
        return;
      }

      _obstacles.add(
        Obstacle(
          x: _nextObstacleX,
          topHeight: topHeight,
          gap: GameConstants.obstacleGap,
          width: GameConstants.obstacleWidth,
        ),
      );

      _nextObstacleX += 400;
    }
  }

  void _checkCollisions() {
    for (final obstacle in _obstacles) {
      if (obstacle.checkCollision(
        _airplane.x,
        _airplane.y,
        GameConstants.airplaneSize,
      )) {
        _gameState = _gameState.copyWith(status: GameStatus.gameOver);
        stop();
        return;
      }
    }
  }

  void _updateScore() {
    for (final obstacle in _obstacles) {
      if (obstacle.checkPassed(_airplane.x)) {
        final newScore = _gameState.score + 1;
        _gameState = _gameState.copyWith(score: newScore);
      }
    }
  }

  void _checkBounds() {
    if (_airplane.y < 0 || _airplane.y > _screenHeight) {
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
    _airplane = Airplane(
      x: GameConstants.initialAirplaneX,
      y: _screenHeight / 2,
    );
    _obstacles.clear();
    _nextObstacleX = _screenWidth;
    onUpdate(_airplane, _gameState, _obstacles);
  }

  void dispose() {
    stop();
  }
}
