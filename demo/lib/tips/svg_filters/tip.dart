import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class DissolveAnimation extends StatefulWidget {
  const DissolveAnimation({Key? key}) : super(key: key);

  @override
  State<DissolveAnimation> createState() => _DissolveAnimationState();
}

class _DissolveAnimationState extends State<DissolveAnimation> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _noiseSeed = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _animation = Tween<double>(begin: 0, end: 50).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut)
    );
    
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    setState(() {
      _noiseSeed = math.Random().nextInt(1000);
    });
    _controller.forward(from: 0);
  }

  String _buildSvg() {
    return '''
      <svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
        <defs>
          <filter id="dissolveEffect">
            <!-- Create random noise pattern -->
            <feTurbulence 
              type="fractalNoise"
              baseFrequency="0.03"
              numOctaves="3"
              seed="$_noiseSeed"
              result="noise" />
            
            <!-- Scale the noise effect -->
            <feColorMatrix
              in="noise"
              type="matrix"
              values="1 0 0 0 0
                      0 1 0 0 0
                      0 0 1 0 0
                      0 0 0 ${_animation.value / 25} 0"
              result="scaledNoise" />
            
            <!-- Use noise to displace the image -->
            <feDisplacementMap
              in="SourceGraphic"
              in2="scaledNoise"
              scale="${_animation.value}"
              xChannelSelector="R"
              yChannelSelector="G" />
            
            <!-- Add fade out effect -->
            <feColorMatrix
              type="matrix"
              values="1 0 0 0 0
                      0 1 0 0 0
                      0 0 1 0 0
                      0 0 0 ${1 - (_animation.value / 50)} 0" />
          </filter>
        </defs>

        <!-- Example content to apply the effect to -->
        <g filter="url(#dissolveEffect)">
          <path d="M10 10 H 90 V 90 H 10 Z" fill="blue"/>
        </g>
      </svg>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.string(
              _buildSvg(),
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startAnimation,
              child: const Text('Dissolve'),
            ),
          ],
        ),
      ),
    );
  }
}