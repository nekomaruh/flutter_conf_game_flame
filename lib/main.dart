import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_game_flame/game_world.dart';

void main() {
  final gameWidget = GameWidget(game: GameWorld());
  runApp(gameWidget);
}
