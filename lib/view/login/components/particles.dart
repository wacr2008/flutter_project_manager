import 'dart:math';

import 'package:admin/utils/login_simple_animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 登录界面背景的动态粒子及其动画效果
class Particles extends StatefulWidget {
  final int numberOfParticles; // 粒子数量

  const Particles(this.numberOfParticles, {key}) : super(key: key);

  @override
  _ParticlesState createState() => _ParticlesState();
}

class _ParticlesState extends State<Particles> {
  final Random random = Random();
  final List<ParticleModel> particles = [];

  @override
  void initState() {
    List.generate(widget.numberOfParticles, (index) {
      particles.add(ParticleModel(random));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Rendering(
      startTime: const Duration(seconds: 30),
      onTick: _simulateParticles,
      builder: (context, time) {
        return CustomPaint(
          painter: ParticlePainter(particles, time),
        );
      },
    );
  }

  _simulateParticles(Duration time) {
    for (var particle in particles) {
      particle.maintainRestart(time);
    }
  }
}

/// 粒子模版类
class ParticleModel {
  late Animatable tween;
  late double size;
  late AnimationProgress animationProgress;
  Random random;

  ParticleModel(this.random) {
    restart();
  }

  restart({Duration time = Duration.zero}) {
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(), 1.2);
    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), -0.2);
    final duration = Duration(milliseconds: 3000 + random.nextInt(6000));

    tween = MultiTrackTween([
      Track("x").add(
          duration, Tween(begin: startPosition.dx, end: endPosition.dx),
          curve: Curves.easeInOutSine),
      Track("y").add(
          duration, Tween(begin: startPosition.dy, end: endPosition.dy),
          curve: Curves.easeIn),
    ]);
    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = 0.2 + random.nextDouble() * 0.4;
  }

  maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}

class ParticlePainter extends CustomPainter {
  List<ParticleModel> particles;
  Duration time;

  ParticlePainter(this.particles, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withAlpha(50);

    for (var particle in particles) {
      var progress = particle.animationProgress.progress(time);
      final animation = particle.tween.transform(progress);
      final position =
          Offset(animation["x"] * size.width, animation["y"] * size.height);
      canvas.drawCircle(position, size.width * 0.2 * particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(
          const Duration(seconds: 3),
          ColorTween(
              begin: const Color(0xFF2A2D3E), end: Color(0xFF212332))), // const Color(0xff8a113a)  Colors.lightBlue.shade900
      Track("color2").add(const Duration(seconds: 3),
          ColorTween(begin: const Color(0xFF2A2D3E), end: Color(0xFF212332))) // const Color(0xff440216)  end: Colors.blue.shade600
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, dynamic animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}
