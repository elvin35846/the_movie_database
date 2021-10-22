import 'package:flutter/material.dart';

class Movie {
  final String id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(id: '1', imageName: 'assets/image/move1.jpg', title: 'm1', time: 'Aprel 7, 2021', description: 'Чтобы защитить семью от могущественного наркобарона, профессиональному вору'),
    Movie(id: '2', imageName: 'assets/image/move1.jpg', title: 'm2', time: 'Aprel 7, 2021', description: 'Чтобы защитить семью от могущественного наркобарона, профессиональному вору'),
    Movie(id: '3', imageName: 'assets/image/move1.jpg', title: 'm3', time: 'Aprel 7, 2021', description: 'Чтобы защитить семью от могущественного наркобарона, профессиональному вору'),
    Movie(id: '4', imageName: 'assets/image/move1.jpg', title: 'Movie name', time: 'Aprel 7, 2021', description: 'Чтобы защитить семью от могущественного наркобарона, профессиональному вору'),
    Movie(id: '5', imageName: 'assets/image/move1.jpg', title: 'Movie name', time: 'Aprel 7, 2021', description: 'Чтобы защитить семью от могущественного наркобарона, профессиональному вору'),
    Movie(id: '6', imageName: 'assets/image/move1.jpg', title: 'Movie name', time: 'Aprel 7, 2021', description: 'Чтобы защитить семью от могущественного наркобарона, профессиональному вору'),
    Movie(id: '7', imageName: 'assets/image/move1.jpg', title: 'Movie name', time: 'Aprel 7, 2021', description: 'Чтобы защитить семью от могущественного наркобарона, профессиональному вору'),
    Movie(id: '8', imageName: 'assets/image/move1.jpg', title: 'Movie name', time: 'Aprel 7, 2021', description: 'Чтобы защитить семью от могущественного наркобарона, профессиональному вору'),
    Movie(id: '9', imageName: 'assets/image/move1.jpg', title: 'Movie name', time: 'Aprel 7, 2021', description: 'Чтобы защитить семью от могущественного наркобарона, профессиональному вору'),
    Movie(id: '10', imageName: 'assets/image/move1.jpg', title: 'Movie name', time: 'Aprel 7, 2021', description: 'Чтобы защитить семью от могущественного наркобарона, профессиональному вору'),
  ];

  final _searchController = TextEditingController();

  var _filterMovies = <Movie>[];

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filterMovies = _movies.where((Movie element) {
        return element.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filterMovies = _movies;
    }
    setState(() {});
  }

  void _onMovieTap(int index) {
    final currentId = _movies[index].id;
    Navigator.of(context).pushNamed('/mainScreenWidget/movieDetailsWidget', arguments: currentId);
  }

  @override
  void initState() {
    super.initState();
    _filterMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filterMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filterMovies[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: Row(children: [
                        Image.asset(
                          movie.imageName,
                          width: 100.0,
                          height: 235.0,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  movie.time,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 18),
                                Text(
                                  movie.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        onTap: () => _onMovieTap(index),
                      ),
                    ),
                  ],
                ),
              );
            }),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
