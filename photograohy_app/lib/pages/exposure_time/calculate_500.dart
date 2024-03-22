class CalculationService {
  static double getCropFactor(String cameraSensor) {
    switch (cameraSensor) {
      case 'Full Frame (35mm)':
        return 1.0;
      case 'APS-C (Canon EF-S/EF-M 1.6x)':
        return 1.6;
      case 'APS-C (Nikon DX, Sigma Foveon X3, Fujifilm X, Pentax K, Sony DT & E-NEX 1.5x)':
        return 1.5;
      case 'APS-H (Canon, Leica M8)':
        return 1.3;
      case 'Medium Format (Leaf, Hasselblad, Phase One, Pentax 645D, Fujifilm GFX 0.79x)':
        return 0.79;
      case 'Medium Format (0.64x)':
        return 0.64;
      case '1 (Nikon 1,CX, Sony RX, Canon G7 x 2.7x)':
        return 2.7;
      case '4/3 Four Third (Olympus Panasonic 1.84x)':
        return 1.84;
      default:
        return 1.0;
    }
  }

  static double calculateRule(String cameraSensor, double focalLength) {
    double cropFactor = getCropFactor(cameraSensor);

    return (500 * cropFactor) / focalLength;
  }
}
