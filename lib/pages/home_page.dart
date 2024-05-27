import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String titulo;
  late String txtBotao;
  bool mostrarConteudo = false;
  late String fraseAtual;
  String botaoLabel = 'QUEBRAR BISCOITO';
  String tituloAtual = 'BISCOITO DA SORTE';

  final List<String> frasesDaSorte = [
    "Acredite em você mesmo e todas as coisas se tornarão possíveis.",
    "Grandes surpresas estão reservadas para você.",
    "Sua determinação o levará longe na vida.",
    "Cada desafio é uma oportunidade disfarçada.",
    "A felicidade está ao seu alcance.",
    "Um encontro inesperado mudará sua vida.",
    "Seja gentil e generoso, e boas coisas acontecerão.",
    "A prosperidade está à sua porta.",
    "Seus sonhos estão prestes a se realizar.",
    "O sucesso vem para aqueles que agem.",
    "Você está cercado de amor e apoio.",
    "Aproveite as oportunidades que surgirem.",
    "A sorte favorece os audaciosos.",
    "Hoje é um bom dia para começar algo novo.",
    "O esforço de hoje é o sucesso de amanhã.",
    "Você é mais forte do que pensa.",
    "Confie no processo da vida.",
    "Uma nova aventura está à espreita.",
    "Siga seu coração e você encontrará o caminho certo.",
    "A bondade que você espalha voltará para você.",
    "Algo maravilhoso está prestes a acontecer.",
    "Seja paciente, grandes coisas levam tempo.",
    "O amor está em seu futuro.",
    "O universo está conspirando a seu favor.",
    "Grandes coisas estão a caminho.",
    "Um sorriso pode mudar o dia de alguém.",
    "A mudança é a única constante, abrace-a.",
    "Você é a luz que ilumina o mundo.",
    "Cada dia é uma nova chance de ser feliz.",
    "Sua intuição nunca falha, confie nela.",
    "A gratidão transforma o que temos em suficiente.",
    "Seu otimismo atrai boas energias.",
    "O conhecimento é um tesouro, busque-o.",
    "Uma atitude positiva é seu maior trunfo.",
    "O sucesso é uma jornada, não um destino.",
    "Seu potencial é ilimitado.",
    "A paz interior começa com um sorriso.",
    "A simplicidade é o auge da sofisticação.",
    "A alegria está nos pequenos momentos.",
    "Seja a mudança que você quer ver no mundo.",
    "O amor próprio é o melhor amor.",
    "Você é capaz de grandes feitos.",
    "As melhores coisas da vida não são coisas.",
    "O tempo cura todas as feridas.",
    "Sua criatividade é uma fonte de inspiração.",
    "A vida é uma bela jornada, aproveite cada passo.",
    "A persistência vence a resistência.",
    "Sua coragem é sua maior força.",
    "A vida é um presente, viva-a plenamente.",
    "Você é único e especial, nunca esqueça disso.",
    "A sorte está ao seu lado.",
    "Cada pequena vitória é um passo para algo maior.",
    "Oportunidades surgirão quando você menos esperar.",
    "Seu trabalho árduo será recompensado em breve.",
    "A confiança é a chave para o sucesso.",
    "O amor verdadeiro está mais próximo do que você imagina.",
    "Grandes mudanças estão a caminho.",
    "Sua atitude positiva é contagiante.",
    "Você é uma inspiração para os outros.",
    "Acredite no poder dos seus sonhos.",
    "A vida é curta, aproveite cada momento.",
    "Você está destinado a fazer grandes coisas.",
    "Seja corajoso e siga em frente.",
    "Um novo começo está no horizonte.",
    "A paz interior é o seu maior tesouro.",
    "Você merece todo o sucesso do mundo.",
    "Acredite na magia dos pequenos momentos.",
    "Cada dia é uma nova oportunidade.",
    "Você está cercado de amor e luz.",
    "Grandes realizações estão ao seu alcance.",
    "Você é mais forte do que imagina.",
    "A felicidade está dentro de você.",
    "Seja grato pelo que você tem.",
    "A sorte sempre favorece os corajosos.",
    "Você está prestes a descobrir algo maravilhoso.",
    "O amor e a alegria estão em seu futuro.",
    "Acredite no impossível.",
    "A vida é uma aventura maravilhosa.",
    "Você tem o poder de mudar o mundo.",
    "O sucesso está a um passo de distância.",
    "Acredite em seus sonhos e eles se realizarão.",
    "Você é capaz de realizar qualquer coisa.",
    "Grandes coisas vêm para aqueles que esperam.",
    "A vida é cheia de surpresas maravilhosas.",
    "O amor é a resposta para todas as perguntas.",
    "Acredite em milagres.",
    "Você é um farol de esperança para os outros.",
    "Grandes realizações estão a caminho.",
    "A felicidade é um estado de espírito.",
    "Você é digno de todo o amor e felicidade.",
    "A vida é o que você faz dela.",
    "Cada momento é uma nova oportunidade para ser feliz.",
    "Você está cercado de pessoas que o amam.",
    "A sorte está do seu lado.",
    "Você é uma pessoa incrível.",
    "A vida é cheia de maravilhas.",
    "Você é capaz de superar qualquer obstáculo.",
    "O sucesso está em suas mãos.",
    "Acredite em si mesmo e tudo será possível.",
    "A vida é uma jornada, aproveite cada passo.",
    "Você é uma fonte de alegria para os outros.",
    "A felicidade está ao seu alcance.",
    "Você é mais forte do que imagina.",
    "A vida é cheia de possibilidades.",
    "Você é amado e apreciado.",
    "A sorte favorece os corajosos.",
    "Você é uma luz no mundo.",
    "Acredite no poder dos seus sonhos.",
    "A vida é uma aventura emocionante.",
    "Você é capaz de grandes coisas.",
    "A felicidade está dentro de você.",
    "A vida é um presente, aproveite cada momento.",
    "Você é um farol de esperança.",
    "Acredite na magia da vida.",
    "Você é uma inspiração para os outros.",
    "A felicidade está ao seu alcance.",
    "Acredite em si mesmo.",
    "Você é mais forte do que pensa.",
    "A vida é cheia de possibilidades maravilhosas.",
    "Você é amado e apreciado.",
    "Acredite no poder dos seus sonhos.",
    "A vida é uma aventura emocionante.",
    "Você é capaz de grandes coisas.",
    "A felicidade está dentro de você.",
    "A vida é um presente, aproveite cada momento.",
    "Você é um farol de esperança.",
    "Acredite na magia da vida.",
    "Você é uma inspiração para os outros.",
    "A felicidade está ao seu alcance.",
    "Acredite em si mesmo.",
    "Você é mais forte do que pensa.",
    "A vida é cheia de possibilidades maravilhosas.",
    "Você é amado e apreciado.",
    "Acredite no poder dos seus sonhos.",
    "A vida é uma aventura emocionante.",
    "Você é capaz de grandes coisas.",
    "A felicidade está dentro de você.",
    "A vida é um presente, aproveite cada momento.",
    "Você é um farol de esperança.",
    "Acredite na magia da vida.",
    "Você é uma inspiração para os outros.",
    "A felicidade está ao seu alcance.",
    "Acredite em si mesmo.",
    "Você é mais forte do que pensa.",
    "A vida é cheia de possibilidades maravilhosas.",
    "Você é amado e apreciado.",
    "Acredite no poder dos seus sonhos.",
    "A vida é uma aventura emocionante.",
    "Você é capaz de grandes coisas.",
    "A felicidade está dentro de você.",
    "A vida é um presente, aproveite cada momento.",
    "Você é um farol de esperança.",
    "Acredite na magia da vida.",
    "Você é uma inspiração para os outros.",
    "A felicidade está ao seu alcance.",
    "Acredite em si mesmo.",
    "Você é mais forte do que pensa.",
    "A vida é cheia de possibilidades maravilhosas.",
    "Você é amado e apreciado.",
    "Acredite no poder dos seus sonhos.",
    "A vida é uma aventura emocionante.",
    "Você é capaz de grandes coisas.",
    "A felicidade está dentro de você.",
    "A vida é um presente, aproveite cada momento.",
    "Você é um farol de esperança.",
    "Acredite na magia da vida.",
    "Você é uma inspiração para os outros.",
    "A felicidade está ao seu alcance.",
    "Acredite em si mesmo.",
    "Você é mais forte do que pensa.",
    "A vida é cheia de possibilidades maravilhosas.",
    "Você é amado e apreciado.",
    "Acredite no poder dos seus sonhos.",
    "A vida é uma aventura emocionante.",
    "Você é capaz de grandes coisas.",
    "A felicidade está dentro de você.",
    "A vida é um presente, aproveite cada momento.",
    "Você é um farol de esperança.",
    "Acredite na magia da vida.",
    "Você é uma inspiração para os outros.",
    "A felicidade está ao seu alcance.",
    "Acredite em si mesmo.",
    "Você é mais forte do que pensa.",
    "A vida é cheia de possibilidades maravilhosas.",
    "Você é amado e apreciado.",
    "Acredite no poder dos seus sonhos.",
    "A vida é uma aventura emocionante.",
    "Você é capaz de grandes coisas.",
    "A felicidade está dentro de você.",
    "A vida é um presente, aproveite cada momento.",
    "Você é um farol de esperança.",
    "Acredite na magia da vida.",
    "Você é uma inspiração para os outros.",
    "A felicidade está ao seu alcance.",
    "Acredite em si mesmo.",
    "Você é mais forte do que pensa.",
    "A vida é cheia de possibilidades maravilhosas.",
    "Você é amado e apreciado.",
    "Acredite no poder dos seus sonhos.",
    "A vida é uma aventura emocionante.",
    "Você é capaz de grandes coisas.",
    "A felicidade está dentro de você.",
    "A vida é um presente, aproveite cada momento.",
    "Você é um farol de esperança.",
    "Acredite na magia da vida.",
    "Você é uma inspiração para os outros.",
    "A felicidade está ao seu alcance.",
    "Acredite em si mesmo.",
    "Você é mais forte do que pensa.",
    "A vida é cheia de possibilidades maravilhosas.",
    "Você é amado e apreciado.",
    "Acredite no poder dos seus sonhos.",
    "A vida é uma aventura emocionante.",
    "Você é capaz de grandes coisas.",
    "A felicidade está dentro de você.",
    "A vida é um presente, aproveite cada momento.",
    "Você é um farol de esperança.",
    "Acredite na magia da vida.",
    "Você é uma inspiração para os outros.",
    "A felicidade está ao seu alcance.",
    "Acredite em si mesmo.",
    "Você é mais forte do que pensa.",
    "A vida é cheia de possibilidades maravilhosas.",
    "Você é amado e apreciado.",
    "Acredite no poder dos seus sonhos.",
    "A vida é uma aventura emocionante.",
    "Você é capaz de grandes coisas."
  ];

  List<String> favoritos = [];

  @override
  void initState() {
    super.initState();
    fraseAtual = frasesDaSorte[Random().nextInt(frasesDaSorte.length)];
  }

  void _toggleFavorito() {
    setState(() {
      if (favoritos.contains(fraseAtual)) {
        favoritos.remove(fraseAtual);
      } else {
        favoritos.add(fraseAtual);
      }
    });
  }

  void _quebrarBiscoito() {
    setState(() {
      if (mostrarConteudo) {
        fraseAtual = frasesDaSorte[Random().nextInt(frasesDaSorte.length)];
        botaoLabel = 'QUEBRAR BISCOITO';
      } else {
        botaoLabel = 'NOVO BISCOITO';
      }
      mostrarConteudo = !mostrarConteudo;
    });
  }

  void modalListaFavoritos(
      BuildContext context, VoidCallback onFavoritosChanged) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Favoritos')),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                height: 300,
                width: double.maxFinite,
                child: favoritos.isEmpty
                    ? const Center(child: Text('Nenhum favorito adicionado.'))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: favoritos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    SizedBox(
                                      width: 185.h,
                                      child: Text(favoritos[index]),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        size: 30.sp,
                                        Icons.delete,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          favoritos.removeAt(index);
                                          onFavoritosChanged();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(thickness: 1),
                            ],
                          );
                        },
                      ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(450, 900),
      builder: (context, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.red,
            actions: [
              IconButton(
                  icon: Icon(
                    size: 42.sp,
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    modalListaFavoritos(
                      context,
                      () {
                        setState(() {});
                      },
                    );
                  })
            ],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          height: 150.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18.r),
                              bottomRight: Radius.circular(18.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5.r,
                                blurRadius: 7.r,
                                offset: Offset(0, 3.h),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height - 290.h,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  'assets/biscoito.png',
                                  width: 200,
                                  height: 200,
                                  fit: mostrarConteudo
                                      ? BoxFit.cover
                                      : BoxFit.contain,
                                ),
                              ),
                              if (mostrarConteudo)
                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 270.w,
                                        height: 270.h,
                                        margin: EdgeInsets.fromLTRB(
                                            15.w, 0.h, 15.w, 15.h),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5.r,
                                              blurRadius: 7.r,
                                              offset: Offset(0, 3.h),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 150.h,
                                              margin: EdgeInsets.fromLTRB(
                                                  25.w, 15.h, 25.w, 0.h),
                                              child: Center(
                                                child: Text(
                                                  fraseAtual.isEmpty
                                                      ? frasesDaSorte[0]
                                                      : fraseAtual,
                                                  style: const TextStyle(
                                                      fontSize: 17),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Positioned(
                                top: 450.h,
                                left: 50.w,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 300.w,
                                      height: 50.h,
                                      margin: EdgeInsets.fromLTRB(
                                          25.w, 15.h, 25.w, 0.h),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                          ),
                                        ),
                                        onPressed: _quebrarBiscoito,
                                        child: Text(
                                          botaoLabel,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (mostrarConteudo)
                                Positioned(
                                  top: 155.h,
                                  left: 300.w,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          favoritos.contains(fraseAtual)
                                              ? Icons.star
                                              : Icons.star_border,
                                          size: 42.sp,
                                          color: favoritos.contains(fraseAtual)
                                              ? Colors.yellow
                                              : Colors.grey,
                                        ),
                                        onPressed: _toggleFavorito,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          favoritos.contains(fraseAtual)
                                              ? Icons.star_border
                                              : Icons.star_border,
                                          size: 45.sp,
                                          color: favoritos.contains(fraseAtual)
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                        onPressed: _toggleFavorito,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 125.h,
                      left: 70.w,
                      child: Container(
                        width: 300.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(15.r),
                            bottomLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2.r,
                              blurRadius: 5.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              tituloAtual,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
