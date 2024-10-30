import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_game_flame/obstacle/obstacle.dart';

import '../player/player.dart';

class Level extends World with HasGameRef {
  @override
  Future<void> onLoad() async {
    final player = Player();
    final obstacle = Obstacle();
    final background = SpriteComponent(
      sprite: await game.loadSprite('elementos/escenario.png'),
      size: Vector2(1280, 720),
      paint: Paint()..color = Colors.blue,
    );
    add(background);
    add(obstacle);
    add(player);
  }
}
