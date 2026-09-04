import 'package:flutter/material.dart';

class TelaFeed extends StatefulWidget {
  const TelaFeed({super.key});

  @override
  State<TelaFeed> createState() => _TelaFeedState();
}

class _TelaFeedState extends State<TelaFeed> {
  int curtidas = 0;

  void curtir() {
    setState(() {
      curtidas++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8faff),

      appBar: AppBar(
        backgroundColor: const Color(0xfffbf7ff),
        elevation: 0,

        title: const Text(
          "Lyvia",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff071b3a),
          ),
        ),

        actions: [
          const Icon(Icons.favorite_border, color: Colors.black),

          const SizedBox(width: 6),

          Center(
            child: Text(
              "$curtidas curtidas",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(width: 30),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "Projetos Recentes",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff071b3a),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Wrap(
                spacing: 25,
                runSpacing: 25,

                children: [
                  Container(
                    width: 350,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xffdde3ea)),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(22),
                                topRight: Radius.circular(22),
                              ),

                              child: Image.asset(
                                "assets/EVM.png",
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Positioned(
                              top: 15,
                              right: 15,

                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),

                                child: IconButton(
                                  onPressed: curtir,
                                  icon: const Icon(Icons.favorite_border),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Padding(
                          padding: EdgeInsets.all(28),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "EVM",
                                style: TextStyle(
                                  color: Color(0xff1d4d4a),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                "Projeto de Hackathon 2026.1",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff64748b),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 350,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xffdde3ea)),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(22),
                                topRight: Radius.circular(22),
                              ),

                              child: Image.asset(
                                "assets/ETSfolio2.png",
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Positioned(
                              top: 15,
                              right: 15,

                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),

                                child: IconButton(
                                  onPressed: curtir,

                                  icon: const Icon(Icons.favorite_border),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Padding(
                          padding: EdgeInsets.all(28),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "ETSfolio2",
                                style: TextStyle(
                                  color: Color(0xff1d4d4a),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                "Projeto de TCC - Bosch/Senai.",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff64748b),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 350,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xffdde3ea)),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(22),
                                topRight: Radius.circular(22),
                              ),

                              child: Image.asset(
                                "assets/Filminis.png",
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Positioned(
                              top: 15,
                              right: 15,

                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),

                                child: IconButton(
                                  onPressed: curtir,

                                  icon: const Icon(Icons.favorite_border),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Padding(
                          padding: EdgeInsets.all(28),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "Filminis",
                                style: TextStyle(
                                  fontFamily: "CherryBombOne",
                                  fontSize: 22,
                                  color: Color(0xff191163),
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                "Integrador da disciplina de Front-End.",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff64748b),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 350,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xffdde3ea)),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(22),
                                topRight: Radius.circular(22),
                              ),

                              child: Image.asset(
                                "assets/Logitter.png",
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Positioned(
                              top: 15,
                              right: 15,

                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),

                                child: IconButton(
                                  onPressed: curtir,
                                  icon: const Icon(Icons.favorite_border),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Padding(
                          padding: EdgeInsets.all(28),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "Logitter",
                                style: TextStyle(
                                  color: Color(0xff006198),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 10),

                              Text(
                                "Projeto de Área - Bosch.",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff64748b),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
