# Sky Flyer

Игровое приложение на Flutter в стиле Flappy Bird, где игрок управляет самолетом, избегая препятствий.

## О проекте

Sky Flyer - это простая аркадная игра, в которой игрок управляет самолетом, нажимая на экран, чтобы поднять его вверх. Цель - пролететь как можно дальше, избегая столкновений с препятствиями и набирая очки.

## Реализованный функционал

- Игровая механика: управление самолетом через нажатия на экран
- Генерация случайных препятствий
- Система подсчета очков
- Экран окончания игры с отображением результата
- Возможность перезапуска игры
- Адаптивная верстка с поддержкой SafeArea
- Скроллируемый виджет окончания игры

## Используемые пакеты

### Зависимости
- `cupertino_icons: ^1.0.8` - иконки для iOS-стиля

### Dev-зависимости
- `flutter_lints: ^6.0.0` - набор правил линтинга
- `flutter_launcher_icons: ^0.14.1` - генерация иконок приложения

## Структура проекта

```
lib/
├── constants/    # Константы игры
├── models/       # Модели данных (самолет, препятствия, состояние игры)
├── screens/      # Экраны приложения
├── services/     # Игровая логика
├── widgets/      # Виджеты UI
└── main.dart     # Точка входа
```

---

# Sky Flyer

A Flutter game application in the style of Flappy Bird where the player controls an airplane avoiding obstacles.

## About the Project

Sky Flyer is a simple arcade game where the player controls an airplane by tapping the screen to make it go up. The goal is to fly as far as possible, avoiding collisions with obstacles and scoring points.

## Implemented Features

- Game mechanics: airplane control via screen taps
- Random obstacle generation
- Score system
- Game over screen with result display
- Game restart functionality
- Adaptive layout with SafeArea support
- Scrollable game over widget

## Used Packages

### Dependencies
- `cupertino_icons: ^1.0.8` - Icons for iOS-style

### Dev Dependencies
- `flutter_lints: ^6.0.0` - Linting rules set
- `flutter_launcher_icons: ^0.14.1` - App icon generation

## Project Structure

```
lib/
├── constants/    # Game constants
├── models/       # Data models (airplane, obstacles, game state)
├── screens/      # Application screens
├── services/     # Game logic
├── widgets/      # UI widgets
└── main.dart     # Entry point
```
