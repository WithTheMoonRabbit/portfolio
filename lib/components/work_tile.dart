final works = List.generate(
    _names.length,
    (index) => Work(
      image: 'assets/images/work_img/${index+1}.png',
      name: _names[index],
    ),
);



final _names = [
  'Portfolio',
  'Lagoon',
  'Debug',
];

class Work {
  Work({
    required this.name,
    required this.image,
});
  final String name;
  final String image;
}