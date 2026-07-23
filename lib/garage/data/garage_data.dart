import '../models/garage_car.dart';

class GarageData {
  static const List<GarageCar> cars = [
    GarageCar(
      id: '1',
      title: 'Porsche 911 GT3 RS',
      category: 'sports',
      imagePath: 'assets/images/trackday.png',
      description:
          '4.0L Flat-Six naturally aspirated track weapon. 520 HP with precision aerodynamics.',
    ),
    GarageCar(
      id: '2',
      title: 'Dodge Challenger Hellcat',
      category: 'muscle',
      imagePath: 'assets/images/dragrace.png',
      description:
          '6.2L Supercharged V8 Hemi. 717 HP pure displacement dominance on the drag strip.',
    ),
    GarageCar(
      id: '3',
      title: 'Nissan GT-R R35 Nismo',
      category: 'sports',
      imagePath: 'assets/images/spotlight.png',
      description:
          '3.8L Twin-Turbo V6. AWD monster outputting 600 HP with legendary launch control.',
    ),
    GarageCar(
      id: '4',
      title: 'Rimac Nevera',
      category: 'electric',
      imagePath: 'assets/images/garage1.png',
      description:
          'Quad-Motor Electric Setup. 1914 HP delivering mind-bending instantaneous torque.',
    ),
    GarageCar(
      id: '5',
      title: 'Mazda RX-7 FD',
      category: 'sports',
      imagePath: 'assets/images/formuladrift.png',
      description:
          '1.3L 13B Rotary. A drift icon re-tuned to 450 HP holding aggressive angles.',
    ),
    GarageCar(
      id: '6',
      title: '1969 Ford Mustang Boss',
      category: 'muscle',
      imagePath: 'assets/images/vintagecarshows.png',
      description:
          'Resto-mod 429 V8. A vintage classic infused with modern fuel injection & suspension.',
    ),
  ];

  static const List<String> categories = [
    'All',
    'Sports',
    'Muscle',
    'Electric',
  ];
}
