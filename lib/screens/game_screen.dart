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

    if (_gameService == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _initializeGame(screenSize.width, screenSize.height);
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
              if (_gameState.status == GameStatus.waiting)
                const Center(
                  child: Text(
                    'Нажмите, чтобы начать',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
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
                  left: 20,
                  child: Text(
                    'Счет: ${_gameState.score}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 4,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                ),
              if (_gameState.status == GameStatus.gameOver)
                Container(
                  color: Colors.black54,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Игра окончена!',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Счет: ${_gameState.score}',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _initializeGame(
                              screenSize.width,
                              screenSize.height,
                            );
                          },
                          child: const Text('Играть снова'),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
