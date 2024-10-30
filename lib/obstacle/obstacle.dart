import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Obstacle extends SpriteComponent with HasGameRef, CollisionCallbacks {
  @override
  Future<void> onLoad() async {
    debugMode = true;
    sprite = await game.loadSprite('elementos/Ready-to-move_Carro-1.png');
    size = Vector2(100, 150);
    position = Vector2(1280 / 2, 720 / 2);
    add(RectangleHitbox());
  }
}
