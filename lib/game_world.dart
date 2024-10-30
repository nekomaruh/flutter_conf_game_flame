import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter_conf_game_flame/level/level.dart';

class GameWorld extends FlameGame with HasKeyboardHandlerComponents{
  CameraComponent? cameraComponent;

  @override
  Future<void> onLoad() async {
    final level = Level();
    cameraComponent = CameraComponent.withFixedResolution(
      width: 1280,
      height: 720,
      world: level
    );
    cameraComponent!.viewfinder.anchor = Anchor.topLeft;
    addAll([cameraComponent!, level]);
  }
}
