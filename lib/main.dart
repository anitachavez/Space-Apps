import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome', style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromARGB(255, 128, 187, 206),
      ),
      backgroundColor: Color.fromARGB(255, 128, 187, 206),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedCharacter(),
            SizedBox(height: 50),
            Text(
              'Welcome to Drop by Drop',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'TrajanPro_Bold',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Click start to navigate',
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NextScreen(),
                  ),
                );
              },
              child: Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}

class RedPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Red Page', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.red, // Fondo rojo
      body: Center(
        child: Text(
          'This is the red page content',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class AnimatedCharacter extends StatefulWidget {
  @override
  _AnimatedCharacterState createState() => _AnimatedCharacterState();
}

class _AnimatedCharacterState extends State<AnimatedCharacter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -15, end: 15).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Image.asset(
            'assets/gota2.png',
            width: 220,
            height: 220,
          ),
        );
      },
    );
  }
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoMoveScreen(),
    );
  }
}

class PhotoMoveScreen extends StatefulWidget {
  @override
  _PhotoMoveScreenState createState() => _PhotoMoveScreenState();
}

class _PhotoMoveScreenState extends State<PhotoMoveScreen> {
  double offsetX = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Move Photo'),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: offsetX, // Controla la posición horizontal de la foto
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  // Actualiza la posición horizontal cuando arrastras la foto
                  setState(() {
                    offsetX += details.delta.dx;
                  });
                },
                child: Container(
                  width: 200, // Ancho de la foto
                  height: 200, // Alto de la foto
                  color: Colors.blue, // Color de fondo de la foto
                  child: Center(
                    child: Text(
                      'Drag Me', // Contenido de la foto
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Click over the topic you want to learn more about',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 32, 56, 98),
      ),
      backgroundColor: Color.fromARGB(255, 68, 119, 208),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WaterCycleScreen(),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'waterCycleImage',
                        child: AnimatedImage(
                          'assets/water.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Which is the water`s cycle?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DroughtsScreen(),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'droughtsImage',
                        child: AnimatedImage(
                          'assets/droughts.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Have you ever wondered',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'what causes droughts?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FloodsScreen(),
                  ),
                );
              },
              child: Hero(
                tag: 'floodsImage',
                child: AnimatedImage(
                  'assets/floods.png',
                  width: 170,
                  height: 170,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'What causes floods?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedImage extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;

  AnimatedImage(this.imagePath, {required this.width, required this.height});

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -15, end: 15).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Image.asset(
            widget.imagePath,
            width: widget.width,
            height: widget.height,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class WaterCycleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Cycle', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: const Color.fromARGB(255, 18, 53, 81),
      body: WaterCycleSlider(),
    );
  }
}

class WaterCycleSlider extends StatefulWidget {
  @override
  _WaterCycleSliderState createState() => _WaterCycleSliderState();
  
}

class _WaterCycleSliderState extends State<WaterCycleSlider> {
  final List<String> images = [
    'assets/water_cycle.png',
    'assets/evaporation.png',
    'assets/condensation.png',
    'assets/precipitation.png',
    'assets/collection.png',
    // Agrega aquí más rutas de imágenes si es necesario
  ];

  final List<String> captions = [
    'The water cycle is a natural process that describes how water moves around our planet. It all starts when the Sun shines on water in rivers, lakes, and oceans, making some of it disappear into the air through a process called evaporation. This invisible water vapor goes up into the sky and forms clouds through a process called condensation. When these clouds get heavy, they release their water as rain, snow, or hail, which is called precipitation. This water then falls back to the Earth and collects in rivers, lakes, and oceans, ready to begin the cycle all over again. The water cycle is like a fantastic adventure where water goes up, makes clouds, falls as rain, and then repeats, ensuring we always have clean, fresh water to drink and use. It`s like a never-ending dance of water in the sky and on the ground! ',
    'The phase of evaporation in the water cycle is when water changes from a liquid state (like in rivers, lakes, or oceans) into a vapor or gas state. \ This happens when the sun`s heat energy shines on the water`s surface, causing the water molecules to gain energy and become steam or water vapor. \ Imagine a puddle of water on a sunny day. As the sun shines on the water, it warms it up. \ Some of the water on the surface starts to turn into invisible water vapor or steam and rises into the air. \ This process is called evaporation. Think of it like this- Evaporation is like water disappearing into the air when it gets warm and sunny. \ Later in the water cycle, this water vapor may cool down and form clouds, eventually leading to precipitation (rain or snow) and completing the water cycle.',
    'Condensation is a fascinating part of the water cycle. Imagine a hot, sunny day when the sun is shining bright. As the sun`s warmth reaches the Earth`s surface, it also heats up the water in oceans, rivers, and even puddles. This warmth causes the water to transform into something called "water vapor." Water vapor is like invisible water in the air. Now, here comes the exciting part. When the warm, moist air rises up into the sky, it meets cooler air high above. This cooler air makes the water vapor slow down and come together, almost like when your breath forms mist on a cold window. As the water vapor comes together, it forms tiny water droplets, and these droplets gather to create clouds in the sky. Think of clouds as collections of these tiny water droplets hanging out together. And when there are lots and lots of these droplets in the cloud, they can get heavy, and that`s when we get raindrops falling from the clouds. So, condensation is like nature`s way of turning invisible water vapor into clouds and, eventually, rain, which helps keep our planet fresh and green. Cool, right?',
    'Precipitation is like a magical gift from the sky. Sometimes, the clouds in the sky get heavy with water droplets. When there are too many droplets and they can`t stay in the clouds anymore, they fall to the ground. It`s like the sky is sharing its water with us.Imagine you`re outside, and suddenly you feel little drops of water falling on your head. That`s rain! It`s like nature is giving a shower to the Earth to help the plants and animals grow. And when it`s really cold, those water droplets turn into snowflakes, creating a beautiful winter wonderland. So, precipitation is like a way the sky takes care of our planet by giving us water when we need it.',
    'The step of "collection" in the water cycle is when water, like rain or snow, gathers together in rivers, lakes, and oceans. It`s like water coming to a big party! These big water bodies are like big pools where all the water hangs out until it`s time for the next part of the water cycle. So, collection is when water gets together in these cool places, and it`s ready to start the cycle all over again. Imagine it`s been raining a lot, and you see raindrops falling from the sky. Those raindrops land on the ground, and some of them flow into streams and rivers. These streams and rivers carry the water downstream, where it all gathers in a big lake or the ocean. It`s like all the raindrops decided to join a big water party in the lake or the ocean! This gathering of water in lakes, rivers, and oceans is what we call "collection" in the water cycle. It`s like nature`s way of storing water for later, so it can evaporate, form clouds, and rain down again when we need it.',
    // Agrega aquí los textos correspondientes a las imágenes
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          images[_currentIndex],
          width: 300,
          height: 300,
        ),
        SizedBox(height: 20),
        Text(
          captions[_currentIndex],
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 36,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex =
                      (_currentIndex - 1 + images.length) % images.length;
                });
              },
            ),
            SizedBox(width: 20),
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                size: 36,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = (_currentIndex + 1) % images.length;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class DroughtsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Droughts', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 91, 59, 14),
      ),
      backgroundColor: Color.fromARGB(255, 242, 169, 67),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'There are 3 main causes of droughts',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Page1Screen(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      AnimatedImage(
                        'assets/global_warming.png',
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Global',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Warming',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Page2Screen(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      AnimatedImage(
                        'assets/overpopulation.png',
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Overpopulation',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Page3Screen(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      AnimatedImage(
                        'assets/agriculture1.png',
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Agriculture',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Page1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Warming'),
      ),
      backgroundColor: Colors.red, // Fondo rojo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/global.png', // Ruta de la imagen que desees mostrar
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Global warming is when the Earth`s temperature gets hotter because of things people do, like using cars and factories that make smoke and pollution. This makes the Earth warmer and can cause problems, like melting ice and making the weather more extreme. For example, when we use cars that run on gasoline, they release something called "greenhouse gases" into the air. These gases trap heat from the sun and make the Earth warmer, just like how a greenhouse keeps plants warm. Imagine if you wore a sweater on a hot summer day; you`d feel really hot, right? That`s a bit like what happens to the Earth because of global warming. It can make places too hot, cause ice at the North and South Poles to melt, and even make sea levels rise, which can flood coastal areas. So, global warming is when the Earth gets too warm because of things we do, and it`s important for us to take care of our planet by using energy wisely and reducing pollution to help keep it cool and safe for everyone.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Color del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Page2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overpopulation'),
      ),
      backgroundColor: Color.fromARGB(255, 27, 167, 78), // Fondo rojo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/over.png', // Ruta de la imagen que desees mostrar
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Overpopulation means there are too many people living in one place, like a city or a country, and it can cause some challenges. Think of it like this: imagine you have a big pizza, but there are so many friends at your party that you run out of pizza slices, and some friends don`t get any. That`s a bit like overpopulation. Here`s an example: if a town has lots and lots of people but not enough houses, schools, or food for everyone, it can be tough. People might not have enough space to play or study, and there might not be enough food for everyone to eat happily. So, overpopulation is when there are too many people for the resources available, and it can make life a bit more challenging. It`s important for us to use resources wisely and plan for the future so everyone can have what they need.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Color del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agriculture'),
        backgroundColor: Color.fromARGB(255, 24, 114, 62),
      ),
      backgroundColor: Color.fromARGB(255, 43, 214, 114), // Fondo rojo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/agri.png', // Ruta de la imagen que desees mostrar
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Agriculture is when people grow plants like crops and raise animals for food. Imagine you have a garden where you grow lots of plants, and you need to water them every day. If you use too much water for your garden and don`t save enough for other things, like drinking water for you and your family, it can cause a drought. For example, if a whole bunch of farms in an area use a lot of water from rivers and lakes to grow their crops, and there isn`t much rain, the rivers and lakes can dry up. That means there`s less water for people to drink and for nature to use. So, it`s important for farmers to use water wisely and not take too much from the environment. When we use water carefully, we can help prevent droughts and make sure there`s enough water for everyone and everything.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Color del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}







class GlobalWarmingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agriculture', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Hero(
              tag: 'agricultureImage',
              child: AnimatedImage(
                'assets/agri.png',
                width: 250,
                height: 250,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'bla bla',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverpopulationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overpopulation', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 91, 59, 14),
      ),
      backgroundColor: Color.fromARGB(255, 217, 141, 35),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Overpopulation',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            Hero(
              tag: 'overpopulationImage',
              child: AnimatedImage(
                'assets/overpopulation.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class AgricultureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agriculture', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 91, 59, 14),
      ),
      backgroundColor: Color.fromARGB(255, 217, 141, 35),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Agriculture',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            Hero(
              tag: 'agricultureImage',
              child: AnimatedImage(
                'assets/agriculture1.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class FloodsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floods', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 70, 81, 16),
      ),
      backgroundColor: Color.fromARGB(255, 148, 169, 44),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Hero(
              tag: 'floodsImage',
              child: AnimatedImage(
                'assets/floods.png',
                width: 170,
                height: 170,
              ),
            ),
            SizedBox(height: 10),
                      Text(
                        'Floods happen when there`s too much water in places where it`s not supposed to be. Imagine a big bathtub that suddenly overflows because you forgot to turn off the faucet. That`s a bit like what happens with floods. One of the main reasons floods occur is because of heavy rain. Sometimes, when it rains a lot, like when you see rain coming down in buckets, the rivers and streams can`t hold all the extra water, so they spill over and flood nearby areas. It`s a bit like a glass of water overflowing if you pour too much in it. Another way floods can happen is when we have big storms, like hurricanes. These storms bring lots of rain and strong winds. The rain fills up rivers and can make the ocean water rise and come onto the land, causing coastal flooding. So, floods can happen because of rainstorms and storms from the ocean, and they can make places like streets, houses, and fields really wet.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}

