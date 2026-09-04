import 'package:flutter/material.dart';
import 'package:portifolio/styles/geral.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbf7ff),

      appBar: AppBar(
        backgroundColor: const Color(0xfffbf7ff),
        elevation: 0,
        title: const Text(
          "Lyvia",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),

          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(35),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xffeeeeee),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x10000000),
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),

                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 50,
                  runSpacing: 25,

                  children: [
                    Container(
                      width: 210,
                      height: 210,
                      padding: const EdgeInsets.all(6),

                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x20000000),
                            blurRadius: 15,
                          ),
                        ],
                      ),

                      child: ClipOval(
                        child: Image.asset(
                          "assets/perfil.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "Olá, eu sou a Lyvia Borge🐱",
                          style: titulo,
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "Sou estudante de Engenharia da Computação\n"
                          "e estou aprendendo Flutter.",
                          style: contexto,
                        ),

                        const SizedBox(height: 25),

                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: Color(0xff8b5cf6),
                            ),

                            SizedBox(width: 8),

                            Text(
                              "lyvia.borgeelias@gmail.com",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 45),

              const Text(
                "Minhas tecnologias favoritas são:",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff555566),
                ),
              ),

              const SizedBox(height: 20),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 15,

                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 13,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xffdddddd),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x10000000),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),

                    child: const Text(
                      "React",
                      style: botao,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 13,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xffdddddd),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x10000000),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),

                    child: const Text(
                      "Flutter",
                      style: botao,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 13,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xffdddddd),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x10000000),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),

                    child: const Text(
                      "C#",
                      style: botao,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 13,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xffdddddd),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x10000000),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),

                    child: const Text(
                      "Python",
                      style: botao,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 30,

                children: [
                  Container(
                    width: 240,
                    height: 260,
                    padding: const EdgeInsets.all(25),

                    decoration: BoxDecoration(
                      color: const Color(0xfff1edfb),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xffdddddd),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(
                          width: 55,
                          height: 55,

                          decoration: const BoxDecoration(
                            color: Color(0xffe5dcfa),
                            shape: BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.fastfood,
                            size: 28,
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Lanche",
                          style: tituloCard,
                        ),

                        const SizedBox(height: 10),

                        Container(
                          width: 100,
                          height: 1,
                          color: Colors.black12,
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Não continuo uma linha de código sem dar uma beliscadinha.",
                          style: textoCard,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 240,
                    height: 260,
                    padding: const EdgeInsets.all(25),

                    decoration: BoxDecoration(
                      color: const Color(0xffe7f5f5),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xffdddddd),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(
                          width: 55,
                          height: 55,

                          decoration: const BoxDecoration(
                            color: Color(0xffd5eeee),
                            shape: BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.pets,
                            size: 28,
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Animais",
                          style: tituloCard,
                        ),

                        const SizedBox(height: 10),

                        Container(
                          width: 100,
                          height: 1,
                          color: Colors.black12,
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Tenho 3 gatos e 1 hamster, são tudo pra mim.",
                          style: textoCard,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 240,
                    height: 260,
                    padding: const EdgeInsets.all(25),

                    decoration: BoxDecoration(
                      color: const Color(0xfff1f5f9),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xffdddddd),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(
                          width: 55,
                          height: 55,

                          decoration: const BoxDecoration(
                            color: Color(0xffe4eef9),
                            shape: BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.palette,
                            size: 28,
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Minimalista",
                          style: tituloCard,
                        ),

                        const SizedBox(height: 10),

                        Container(
                          width: 100,
                          height: 1,
                          color: Colors.black12,
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          "Acredito que menos é sempre mais na hora do visual.",
                          style: textoCard,
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