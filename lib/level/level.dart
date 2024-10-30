import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Level extends World with HasGameRef {
  @override
  Future<void> onLoad() async {
    final background = SpriteComponent(
      sprite: await game.loadSprite('elementos/escenario.png'),
      size: Vector2(1280, 720),
      paint: Paint()..color = Colors.blue,
    );
    add(background);
  }
}