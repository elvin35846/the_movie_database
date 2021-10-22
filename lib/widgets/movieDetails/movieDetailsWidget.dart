import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MovieDetailsWidget extends StatefulWidget {
  final String movieCurrentId;

  const MovieDetailsWidget({Key? key, required this.movieCurrentId}) : super(key: key);

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/image/TMD_logo.png',
              fit: BoxFit.contain,
              width: 55,
            ),
            IconButton(
              icon: const Icon(Icons.person),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.lightBlue,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: ColoredBox(
          color: Color.fromRGBO(24, 23, 27, 1.0),
          child: ListView(
            children: [
              MovieDetailsMainInfoWidget(value: widget.movieCurrentId),
              MovieDetailsCastWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieDetailsCastWidget extends StatelessWidget {
  const MovieDetailsCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Series Cast', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: 230,
            child: Scrollbar(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                //itemExtent: 120,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black.withOpacity(0.2)),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image/act_1.jpg',
                              height: 133.0,
                              fit: BoxFit.cover,
                            ),
                            //SizedBox(height: 5),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ellen Pompeo', maxLines: 1, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                  Text('Meredith Grey', maxLines: 1, style: TextStyle(fontSize: 14)),
                                  Text('383 episode', maxLines: 1, style: TextStyle(fontSize: 14, color: Colors.grey)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {},
              child: Text('Full Cast & Crew', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieDetailsMainInfoWidget extends StatelessWidget {
  final String value;
  const MovieDetailsMainInfoWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPosters(),
        Padding(
          padding: EdgeInsets.all(15),
          child: _MovieName(),
        ),
        _ScoreWidget(),
        _SumeryWidget(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overview',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Follows the personal and professional lives of a group of doctors at Seattle’s Grey Sloan Memorial Hospital.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Shonda Rhimes', style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text('Director', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ]),
                  ),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Shonda Rhimes', style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text('Director', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ]),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Shonda Rhimes', style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text('Director', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ]),
                  ),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Shonda Rhimes', style: TextStyle(fontSize: 16, color: Colors.white)),
                      Text('Director', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ]),
                  ),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }
}

class _TopPosters extends StatelessWidget {
  const _TopPosters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/image/card_bg.jpg',
          height: 235.0,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Image.asset(
            'assets/image/move1.jpg',
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                CircularPercentIndicator(
                  radius: 45.0,
                  animation: true,
                  animationDuration: 1200,
                  percent: 0.72,
                  center: new Text("72%", style: TextStyle(color: Colors.white, fontSize: 12)),
                  progressColor: Colors.green,
                  lineWidth: 4.0,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                SizedBox(width: 10),
                Text('User Score', style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 20,
            color: Colors.grey,
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.white),
                SizedBox(width: 10),
                Text('Play Trailer', style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieName extends StatelessWidget {
  const _MovieName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Grey's Anatomy",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          TextSpan(
            text: ' (2005)',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _SumeryWidget extends StatelessWidget {
  const _SumeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
          child: Text(
            'TV-14 Drama 43m',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )),
    );
  }
}
