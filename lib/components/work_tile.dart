class Work {
  Work({
    required this.name,
    required this.image,
    required this.url,
  });
  final String name;
  final String image;
  final String url;
}

final _names = [
  'Lagoon',
  'Portfolio',
  'Debug',
];

final _urls = [
  'https://drive.google.com/file/d/1k2Z2MwJZTCluoA_miyDiyumEf_hx9gOJ/view?usp=drive_link',
  'https://drive.google.com/file/d/1_utrGQF3W2D5uwD7_aqMBOcby6K24fnO/view?usp=drive_link',
  'https://drive.google.com/file/d/1-RD0c50YMn6DyeydSOqpYvrgKlRACxJw/view?usp=drive_link',
];

final works = List.generate(
    _names.length,
    (index) => Work(
      image: 'assets/images/work_img/${index+1}.png',
      name: _names[index],
      url: _urls[index],
    ),
);