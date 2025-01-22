# Flutter Ripple Painter

A highly customizable Flutter widget for creating animated ripple effects using custom painting. Perfect for creating engaging visual effects in your Flutter applications, from loading indicators to interactive backgrounds and more.


## Features

- 🎨 Fully customizable ripple appearance
- 🎯 Custom positioning with alignment control
- 📐 Flexible sizing options
- 🔄 Configurable animation duration
- 🌊 Adjustable number of waves
- ✂️ Optional bounds clipping
- 🎭 Support for overlay widgets
- ✨ Smooth, endless animation
- 🎮 Perfect for various use cases (backgrounds, loading indicators, buttons, etc.)

## Usage

### Basic Usage

```dart
import 'package:flutter_ripple_painter/flutter_ripple_painter.dart';

RipplePainter(
  waveColor: Colors.blue,
  child: Text('Center Content'),
)
```

### Advanced Usage

```dart
RipplePainter(
  numberOfWaves: 4,
  animationDuration: const Duration(seconds: 6),
  waveColor: Colors.purple,
  strokeWidth: 3.0,
  maxRadiusPercent: 0.8,
  baseOpacity: 0.3,
  alignment: Alignment.topCenter,
  clipToBounds: false,
  size: Size(200, 200),
  child: Icon(Icons.favorite),
)
```

## Examples

### Loading Indicator
```dart
RipplePainter(
  size: Size(100, 100),
  numberOfWaves: 2,
  waveColor: Colors.blue,
  animationDuration: Duration(seconds: 4),
)
```

### Interactive Button Background
```dart
Material(
  child: InkWell(
    onTap: () {},
    child: RipplePainter(
      size: Size(200, 50),
      waveColor: Colors.purple.withOpacity(0.5),
      child: Center(child: Text('Tap Me')),
    ),
  ),
)
```

### Custom Position Effect
```dart
Stack(
  children: [
    RipplePainter(
      alignment: Alignment.topRight,
      clipToBounds: false,
      waveColor: Colors.red,
    ),
    YourContent(),
  ],
)
```

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| numberOfWaves | int | 3 | Number of concurrent ripple waves |
| animationDuration | Duration | 8 seconds | Duration of one complete ripple cycle |
| waveColor | Color | Colors.white | Color of the ripple waves |
| strokeWidth | double | 2.0 | Stroke width of the ripple circles |
| maxRadiusPercent | double | 0.9 | Maximum radius relative to container width |
| baseOpacity | double | 0.2 | Base opacity of the waves |
| alignment | Alignment? | center | Position of the ripple center |
| clipToBounds | bool | true | Whether to clip ripples to container bounds |
| size | Size? | null | Fixed size for the ripple container |
| child | Widget? | null | Optional overlay widget |

## Custom Painter Details

The package uses `CustomPainter` to create smooth, efficient ripple animations. The painting is optimized for performance and memory usage, making it suitable for various use cases from small indicators to full-screen effects.

## Credits
Originally inspired by a splash screen animation, Generated README via Claude (Anthropic).
