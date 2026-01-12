# Sky Flyer

Игровое приложение на Flutter в стиле Flappy Bird, где игрок управляет самолетом, избегая препятствий.

## Описание проекта

Sky Flyer - это простая аркадная игра, в которой игрок управляет самолетом, нажимая на экран, чтобы поднять его вверх. Цель - пролететь как можно дальше, избегая столкновений с препятствиями и набирая очки.

## Что было сделано

- Создана структура проекта с разделением на экраны, виджеты, модели, сервисы и константы
- Реализован игровой экран с механикой управления самолетом
- Создана система генерации случайных препятствий
- Реализована система подсчета очков
- Добавлен экран окончания игры с отображением результата
- Реализована возможность перезапуска игры
- Созданы переиспользуемые виджеты для самолета, препятствий, счета и диалога окончания игры
- Настроены цвета приложения в отдельном файле констант
- Адаптирован интерфейс с поддержкой SafeArea
- Добавлен скроллируемый виджет окончания игры

## Используемые пакеты

- `flutter` - основной фреймворк
- `cupertino_icons` - иконки для iOS стиля
- `flutter_lints` - линтеры для проверки кода
- `flutter_launcher_icons` - генерация иконок приложения (dev dependency)

## Архитектура

Проект следует принципам SOLID и KISS. Код организован в следующие директории:

- `lib/screens/` - экраны приложения
- `lib/widgets/` - переиспользуемые виджеты
- `lib/models/` - модели данных
- `lib/services/` - бизнес-логика
- `lib/constants/` - константы (цвета, игровые константы)

---

# Sky Flyer

A Flutter game application in the style of Flappy Bird where the player controls an airplane avoiding obstacles.

## Project Description

Sky Flyer is a simple arcade game where the player controls an airplane by tapping the screen to make it go up. The goal is to fly as far as possible, avoiding collisions with obstacles and scoring points.

## What Was Done

- Created project structure with separation into screens, widgets, models, services, and constants
- Implemented game screen with airplane control mechanics
- Created random obstacle generation system
- Implemented score system
- Added game over screen with result display
- Implemented game restart functionality
- Created reusable widgets for airplane, obstacles, score, and game over dialog
- Configured application colors in a separate constants file
- Adapted interface with SafeArea support
- Added scrollable game over widget

## Used Packages

- `flutter` - main framework
- `cupertino_icons` - icons for iOS style
- `flutter_lints` - linters for code checking
- `flutter_launcher_icons` - application icon generation (dev dependency)

## Architecture

The project follows SOLID and KISS principles. Code is organized into the following directories:

- `lib/screens/` - application screens
- `lib/widgets/` - reusable widgets
- `lib/models/` - data models
- `lib/services/` - business logic
- `lib/constants/` - constants (colors, game constants)
