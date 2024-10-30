import 'dart:async';

import 'package:flame/components.dart';

class Player extends SpriteAnimationGroupComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    await _loadAnimation();
    size = Vector2(128, 128);
    position = Vector2(100, 720/2);
  }

  _loadAnimation() async {
    final idle = [await game.loadSprite('personaje/Personaje-F0.png')];
    final run = [
      await game.loadSprite('personaje/Personaje-F1.png'),
      await game.loadSprite('personaje/Personaje-F2.png'),
      await game.loadSprite('personaje/Personaje-F3.png'),
      await game.loadSprite('personaje/Personaje-F4.png'),
      await game.loadSprite('personaje/Personaje-F5.png')
    ];
    animations = {
      'idle': SpriteAnimation.spriteList(idle, stepTime: 0.1),
      'run': SpriteAnimation.spriteList(run, stepTime: 0.1)
    };
    current = 'idle';
    //final sprites = SpriteSheet(image: image, srcSize: srcSize);
  }
}
