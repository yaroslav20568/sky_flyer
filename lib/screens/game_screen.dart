import 'package:flutter/material.dart';

import '../constants/index.dart';
import '../models/index.dart';
import '../services/index.dart';
import '../widgets/index.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Airplane _airplane;
  late GameState _gameState;
  GameService? _gameService;

  @override
  void initState() {
    super.initState();
    _airplane = Airplane(x: GameConstants.initialAirplaneX, y: 300.0);
    _gameState = GameState();
    _initializeGame();
  }

  void _initializeGame() {
    _gameService = GameService(
      onUpdate: (airplane, gameState) {
        if (mounted) {
          setState(() {
            _airplane = airplane;
            _gameState = gameState;
          });
        }
      },
      initialAirplane: _airplane,
      initialGameState: _gameState,
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
                  _gameState.status == GameStatus.gameOver)
                AirplaneWidget(airplane: _airplane),
              if (_gameState.status == GameStatus.gameOver)
                Center(
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
                          _gameService?.reset();
                          setState(() {
                            _airplane = Airplane(
                              x: GameConstants.initialAirplaneX,
                              y: 300.0,
                            );
                            _gameState = GameState();
                          });
                          _initializeGame();
                        },
                        child: const Text('Играть снова'),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
