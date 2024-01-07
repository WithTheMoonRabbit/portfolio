import 'package:flutter/material.dart';
import 'package:portfolio/components/work_tile.dart';

const _duration = Duration(milliseconds: 500);

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final _pageWorkController = PageController(
    viewportFraction: 0.35,
  );

  double _currentPage = 0.0;

  void _workScrollListener() {
    setState(() {
      _currentPage = _pageWorkController.page!;
    });
  }


  @override
  void initState() {
    _pageWorkController.addListener(_workScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageWorkController.removeListener(_workScrollListener);
    _pageWorkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            bottom: -size.height * 0.22,
            height: size.height * 0.3,
            child: const DecoratedBox(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.brown,
                  blurRadius: 90,
                  spreadRadius: 45,
                ),
              ]),
            ),
          ),
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
                controller: _pageWorkController,
                scrollDirection: Axis.vertical,
                itemCount: works.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const SizedBox.shrink();
                  }
                  final work = works[index - 1];
                  final result = _currentPage - index + 1;
                  final value = -0.4 * result + 1;
                  final opacity = value.clamp(0.0, 1.0);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..translate(
                          0.0,
                          size.height / 2.6 * (1 - value).abs(),
                        )
                        ..scale(value),
                      child: Opacity(
                        opacity: opacity,
                        child: Image.asset(
                          work.image,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 100,
            child: Column(
              children: [
                AnimatedSwitcher(
                  duration: _duration,
                  child: _currentPage.toInt() < works.length ? Text(
                    works[_currentPage.toInt()].name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                    ),
                  ) : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
