import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

import '../obstacle/obstacle.dart';

class Player extends SpriteAnimationGroupComponent
    with
        HasGameRef,
        KeyboardHandler,
        CollisionCallbacks,
        HasCollisionDetection {
  Vector2 velocity = Vector2.zero();
  Vector2 movement = Vector2.zero();

  @override
  Future<void> onLoad() async {
    debugMode = true;
    await _loadAnimation();
    size = Vector2(128, 128);
    position = Vector2(100, 720 / 2);
    add(
      RectangleHitbox(
        size: Vector2(70, 80),
        position: Vector2(24, 34),
      ),
    );
  }

  _loadAnimation() async {
    final idle = [await game.loadSprite('personaje/Personaje-F0.png')];
    final run = [
      await game.loadSprite('personaje/Personaje-F1.png'),
      await game.loadSprite('personaje/Personaje-F2.png'),
      await game.loadSprite('personaje/Personaje-F3.png'),
      await game.loadSprite('personaje/Personaje-F4.png'),
      await game.loadSprite('personaje/Personaje-F5.png'),
    ];
    final crash = [
      await game.loadSprite('personaje/Personaje-F6.png'),
      await game.loadSprite('personaje/Personaje-F7.png'),
      await game.loadSprite('personaje/Personaje-F8.png'),
      await game.loadSprite('personaje/Personaje-F9.png'),
    ];
    animations = {
      'idle': SpriteAnimation.spriteList(idle, stepTime: 0.1),
      'run': SpriteAnimation.spriteList(run, stepTime: 0.1),
      'crash': SpriteAnimation.spriteList(crash, stepTime: 0.1),
    };
    current = 'run';
    //final sprites = SpriteSheet(image: image, srcSize: srcSize);
  }

  @override
  void update(double dt) {
    super.update(dt);
    _updateAnimation();
    _updateMovement(dt);

  }

  _updateMovement(double dt) {
    velocity = movement * 200;
    position += velocity * dt;
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
     //movement = Vector2.zero();
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      movement.y -= 1;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      movement.y += 1;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      movement.x -= 1;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      movement.x += 1;
    }
    return super.onKeyEvent(event, keysPressed);
  }

  void _updateAnimation() {
    if (velocity != Vector2.zero()) {
      if (velocity.x > 0 && scale.x < 0) {
        flipHorizontallyAroundCenter();
      } else if (velocity.x < 0 && scale.x > 0) {
        flipHorizontallyAroundCenter();
      }
      current = 'run';
    } else {
      current = 'idle';
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Obstacle) {
      position = Vector2(100, 720 / 2);
    }
  }
}
