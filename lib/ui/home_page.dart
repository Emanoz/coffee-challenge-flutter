import 'dart:math';

import 'package:coffee_ui_challenge_app/widgets/numeric_up_down.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';

import '../models/coffee_model.dart';
import '../widgets/coffee_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CoffeeModel> list = [
    CoffeeModel(text: 'Americano', image: 'coffee1.png'),
    CoffeeModel(text: 'Latte', image: 'coffee2.png'),
    CoffeeModel(text: 'Cappuccino', image: 'coffee3.png'),
  ];
  int? _currentIndex;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top + 52.0,
          bottom: MediaQuery.paddingOf(context).bottom + 52.0,
        ),
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ArcText(
                    radius: 58,
                    text: 'BARISTA',
                    textStyle: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700, fontSize: 16.0, color: Colors.brown, letterSpacing: 6),
                    startAngle: -pi / 2,
                    startAngleAlignment: StartAngleAlignment.start,
                    placement: Placement.inside,
                    direction: Direction.clockwise,
                  ),
                  Text('COFFEE', style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 10.0, color: Colors.brown, letterSpacing: 4),)
                ],
              ),
            ),
            SizedBox(
              height: 240.0,
              child: ListView.separated(
                separatorBuilder: (_, index) => SizedBox(
                  width: index < list.length - 1 ? 32.0 : 0.0,
                ),
                controller: _scrollController,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: MediaQuery.sizeOf(context).width / 4),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (_, index) => Draggable<int>(
                  axis: Axis.vertical,
                  maxSimultaneousDrags: 1,
                  childWhenDragging: Container(
                    width: 166.0,
                    height: 166.0,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      list[index].text,
                      style: GoogleFonts.nunito(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  data: index,
                  feedback: index != _currentIndex
                      ? Image.asset(
                          'assets/${list[index].image}',
                          width: 166.0,
                          height: 166.0,
                        )
                      : Container(),
                  child: index != _currentIndex
                      ? CoffeeItem(item: list[index])
                      : Container(
                          width: 166.0,
                          height: 166.0,
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            list[index].text,
                            style: GoogleFonts.nunito(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                ),
              ),
            ),
            Flexible(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Arraste seu café para o prato',
                        style: GoogleFonts.nunito(
                          fontSize: 12.0,
                          color: Colors.brown,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Image.asset('assets/long_down_arrow.png', height: 48.0),
                      ),
                    ],
                  ),
                  DragTarget<int>(
                    //onLeave: (_) => print('fora do target'),
                    //onWillAccept: (value) => value! >= list.length,
                    onAccept: (value) {
                      setState(() {
                        _currentIndex = value;
                      });
                    },
                    builder: (_, candidates, rejects) => _currentIndex != null
                        ? Image.asset(
                            'assets/${list[_currentIndex!].image}',
                            width: 166.0,
                            height: 166.0,
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
            Expanded(child: Image.asset('assets/plate.png', width: 300.0)),
            const Expanded(child: NumericUpDown()),
          ],
        ),
      ),
    );
  }
}
