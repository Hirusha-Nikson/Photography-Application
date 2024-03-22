import 'dart:math' as math;

class NpfCalculator {
  static double calculateNpf({
    required double declination,
    required double lensAperture,
    required double focalLength,
    required double pixelSize,
  }) {
    double accuracy = 2;
    double shutterSpeed = accuracy *
        (16.856 * lensAperture + 0.0997 * focalLength + 13.713 * pixelSize) /
        (focalLength * math.cos(_degreesToRadians(declination)));

    return shutterSpeed;
  }

  static double _degreesToRadians(double degrees) {
    return degrees * (math.pi / 180.0);
  }
}
