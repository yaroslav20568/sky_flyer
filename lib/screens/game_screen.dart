import 'package:flutter/material.dart';

import 'package:sky_flyer/constants/index.dart';
import 'package:sky_flyer/models/index.dart';
import 'package:sky_flyer/services/index.dart';
import 'package:sky_flyer/widgets/index.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Airplane _airplane;
  late GameState _gameState;
  List<Obstacle> _obstacles = [];
  GameService? _gameService;

  @override
  void initState() {
    super.initState();
    _airplane = Airplane(x: GameConstants.initialAirplaneX, y: 300.0);
    _gameState = GameState();
  }

  void _initializeGame(double screenWidth, double screenHeight) {
    if (screenWidth <= 0 || screenHeight <= 0) {
      return;
    }

    _airplane = Airplane(
      x: GameConstants.initialAirplaneX,
      y: screenHeight / 2,
    );
    _gameState = GameState();
    _obstacles = [];

    _gameService?.dispose();
    _gameService = GameService(
      onUpdate: (airplane, gameState, obstacles) {
        if (mounted) {
          setState(() {
            _airplane = airplane;
            _gameState = gameState;
            _obstacles = obstacles;
          });
        }
      },
      initialAirplane: _airplane,
      initialGameState: _gameState,
      screenWidth: screenWidth,
      screenHeight: screenHeight,
    );
  }

  void _handleTap() {
    _gameService?.jump();
  }

  @override
  void dispose() {
    _gameService?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (_gameService == null && screenSize.width > 0 && screenSize.height > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && screenSize.width > 0 && screenSize.height > 0) {
          _initializeGame(screenSize.width, screenSize.height);
        }
      });
    }

    return Scaffold(
      body: GestureDetector(
        onTap: _handleTap,
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF87CEEB), Color(0xFFE0F6FF)],
            ),
          ),
          child: Stack(
            children: [
              if (_gameState.status == GameStatus.waiting) const StartScreen(),
              if (_gameState.status == GameStatus.playing ||
                  _gameState.status == GameStatus.gameOver) ...[
                ..._obstacles.map(
                  (obstacle) => ObstacleWidget(
                    obstacle: obstacle,
                    screenHeight: screenSize.height,
                  ),
                ),
                AirplaneWidget(airplane: _airplane),
              ],
              if (_gameState.status == GameStatus.playing)
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Center(child: ScoreWidget(score: _gameState.score)),
                ),
              if (_gameState.status == GameStatus.gameOver)
                GameOverDialog(
                  score: _gameState.score,
                  onRestart: () {
                    _initializeGame(screenSize.width, screenSize.height);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
