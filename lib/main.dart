import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA80A0A), // rojo oscuro
        title: const Text(
          "Coffee & Roses",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image: NetworkImage(
              'https://raw.githubusercontent.com/Mota-Jesus/Coffee_n_roses/main/cappuccino.png',
            ),
            title: 'Cappuccino',
            description:
                'Una mezcla clásica de espresso con leche espumosa. Perfecto para comenzar el día.',
          ),
          makePage(
            page: 2,
            image: NetworkImage(
              'https://raw.githubusercontent.com/Mota-Jesus/Coffee_n_roses/main/mocha.png',
            ),
            title: 'Mocha',
            description:
                'Café con chocolate caliente, coronado con crema batida. Dulce y reconfortante.',
          ),
          makePage(
            page: 3,
            image: NetworkImage(
              'https://raw.githubusercontent.com/Mota-Jesus/Coffee_n_roses/main/macchiato.png',
            ),
            title: 'Caramel Macchiato',
            description:
                'Una deliciosa mezcla de espresso intenso, leche cremosa y un toque de caramelo. Perfecto para quienes disfrutan de un sabor dulce con cuerpo.',
          ),

          makePage(
            page: 4,
            image: NetworkImage(
              'https://raw.githubusercontent.com/Mota-Jesus/Coffee_n_roses/main/latte.png',
            ),
            title: 'Latte',
            description:
                'Una suave combinación de espresso y leche al vapor. El equilibrio perfecto.',
          ),
        ],
      ),
    );
  }

  Widget makePage({
    required ImageProvider image,
    required String title,
    required String description,
    required int page,
  }) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  FadeInUp(
                    child: Text(
                      page.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '/$totalPage',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      child: Row(
                        children: <Widget>[
                          for (var i = 0; i < 4; i++)
                            const Padding(
                              padding: EdgeInsets.only(right: 3),
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                            ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 15,
                            ),
                          ),
                          const Text(
                            '4.0',
                            style: TextStyle(color: Colors.white70),
                          ),
                          const Text(
                            ' (2300)',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          description,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            height: 1.9,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      child: Text(
                        'ORDENAR AHORA',
                        style: TextStyle(
                          color: const Color(0xFFE3A857), // dorado suave
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
