import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../utilities/colors.dart';
import '../utilities/variavel.dart';
import '../widgets/custom_button.dart';
import '../widgets/my_appbar.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.2),
          child: const MyAppBar(
              title: "Insira os valores!",
              barElevation: 2.0,
              leftIcon: Icons.calculate,
              rightIcon: Icons.folder)),
      body: const CalculatorBody(),
    );
  }
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
                      shadows: [
                        BoxShadow(
                          color: Colors.grey,
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
                                color: favoDark, fontSize: height * 0.03),
                          ),
                        ),
                        SizedBox(
                          width: widht * 0.05,
                        ),
                        Flexible(
                          child: Container(
                            //color: Colors.green,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: variaveis[index].unidade as String,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: favoLight, fontSize: height * 0.025),
                              ),
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
