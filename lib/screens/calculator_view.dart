import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../utilities/colors.dart';
import '../utilities/variavel.dart';
import '../widgets/custom_button.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      appBar: CalculatorBar(),
      body: CalculatorBody(),
    );
  }
}

class CalculatorBar extends StatelessWidget with PreferredSizeWidget {
  const CalculatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const ShapeDecoration(
        shadows: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 1.0),
            blurRadius: 4.0,
          ),
        ],
        color: Colors.white,
        shape: RoundedRectangleBorder(),
      ),
      child: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.03),
            child: PopupMenuButton(
                child: Icon(
                  Icons.list,
                  color: favoDark,
                  size: height * 0.05,
                ),
                itemBuilder: (context) => [
                      const PopupMenuItem(child: Text("minha rola")),
                      const PopupMenuItem(child: Text("minha pica")),
                    ]),
          )
        ],
        backgroundColor: primaryColor,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.03),
          child: GestureDetector(
              child: Icon(
            Icons.calculate,
            color: favoLight,
            size: height * 0.05,
          )),
        ),
        title: Text(
          "Insira os valores!",
          style: TextStyle(
            color: favoDark,
            fontSize: height * 0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CalculatorBody extends StatefulWidget {
  const CalculatorBody({Key? key}) : super(key: key);

  @override
  State<CalculatorBody> createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  List<Variavel> variaveis = [
    Variavel(name: 'Área', unidade: 'hectares'),
    Variavel(name: 'Vazão do Emissor', unidade: 'litros/h'),
    Variavel(name: 'Espaçamento entre Emissores', unidade: 'metros'),
    Variavel(name: 'Espaçamento entre Linhas', unidade: 'metros'),
    Variavel(name: 'Número de Setores', unidade: 'uni'),
    Variavel(name: 'Pressão de Serviço do Emissor', unidade: 'MCA'),
    Variavel(name: 'Vazão Total', unidade: 'm³/h'),
    Variavel(name: 'Cavalete/Registro/Válvula', unidade: 'MCA'),
    Variavel(name: 'Comprimento Rede Ramal', unidade: 'metros'),
    Variavel(name: 'Diâmetro do Tubo Ramal', unidade: 'polegada'),
    Variavel(name: 'Comprimento Rede Adutora', unidade: 'metros'),
    Variavel(name: 'Diâmetro do Tubo Adutora', unidade: '??'),
    Variavel(name: 'Desnível Total', unidade: '??'),
    Variavel(name: 'Filtragem', unidade: 'MCA'),
    Variavel(name: 'Altura de Sucção', unidade: 'MCA'),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: variaveis.length + 1,
        itemBuilder: (context, index) {
          if (index == variaveis.length) {
            return Column(
              children: [
                SizedBox(height: height * 0.04),
                ButtonContainer(
                  title: "Calcular",
                  buttonColor: favoLight,
                  titleColor: primaryColor,
                  onPress: () {},
                ),
                SizedBox(height: height * 0.04),
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      widht * 0.02, widht * 0.02, widht * 0.02, 0),
                  child: Container(
                    decoration: ShapeDecoration(
                      // ignore: prefer_const_literals_to_create_immutables
                      shadows: [
                        // ignore: prefer_const_constructors
                        BoxShadow(
                          color: Colors.grey,
                          // ignore: prefer_const_constructors
                          offset: Offset(1.0, 1.0),
                          blurRadius: 4.0,
                        ),
                      ],
                      color: Colors.white,
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 15,
                          cornerSmoothing: 0.8,
                        ),
                      ),
                    ),
                    height: height * 0.1,
                    child: Row(
                      children: [
                        SizedBox(
                          width: widht * 0.03,
                        ),
                        Container(
                          color: Colors.white,
                          width: widht * 0.65,
                          child: Text(
                            variaveis[index].name as String,
                            style: TextStyle(
                              color: favoDark,
                              fontSize: height * 0.03,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: widht * 0.05,
                        ),
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: variaveis[index].unidade as String,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: favoLight, fontSize: height * 0.025),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }
}
