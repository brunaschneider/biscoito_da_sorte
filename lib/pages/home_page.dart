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
    "Você é capaz de grandes coisas.",
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
