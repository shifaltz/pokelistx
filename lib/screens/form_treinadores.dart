import 'package:flutter/material.dart';
import 'package:pokelistx/dao/treinadores_dao.dart';
import 'package:pokelistx/models/treinador.dart';

class FormTreinadores extends StatefulWidget {

  @override
  _FormTreinadoresState createState() => _FormTreinadoresState();
}

class _FormTreinadoresState extends State<FormTreinadores> {
  final TextEditingController _nomeTreinador = TextEditingController();

  final TextEditingController _cidadeTreinador = TextEditingController();

  final TreinadoresDao _dao = TreinadoresDao();

  String pokemonInicial = 'Bulbasaur';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Cadastro Treinador', style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeTreinador,
              decoration: InputDecoration(
                labelText: 'Nome do Treinador',
              ),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _cidadeTreinador,
                decoration: InputDecoration(
                  labelText: 'Cidade do Treinador',
                ),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => pokemonInicial = 'Bulbasaur'),
                    child: Container(
                      height: 56,
                      width: 56,
                      child: ColorFiltered(
                        child:
                        Image.asset('assets/icons/icon_Bulbasaur.png'),
                        colorFilter: pokemonInicial == 'Bulbasaur' ? ColorFilter.mode(Colors.transparent, BlendMode.color) : ColorFilter.mode(Colors.white24, BlendMode.dstATop),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => pokemonInicial = 'Charmander'),
                    child: Container(
                      height: 56,
                      width: 56,
                      child: ColorFiltered(
                        child:
                        Image.asset('assets/icons/icon_Charmander.png'),
                        colorFilter: pokemonInicial == 'Charmander' ? ColorFilter.mode(Colors.transparent, BlendMode.color) : ColorFilter.mode(Colors.white24, BlendMode.dstATop),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => pokemonInicial = 'Squirtle'),
                    child: Container(
                      height: 56,
                      width: 56,
                      child: ColorFiltered(
                        child:
                        Image.asset('assets/icons/icon_Squirtle.png'),
                        colorFilter: pokemonInicial == 'Squirtle' ? ColorFilter.mode(Colors.transparent, BlendMode.color) : ColorFilter.mode(Colors.white24, BlendMode.dstATop),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text('Cadastrar'),
                  onPressed: (){
                    final String nomeTreinador = _nomeTreinador.text;
                    final String cidadeTreinador = _cidadeTreinador.text;
                    if(nomeTreinador != null && cidadeTreinador != null){
                      final Treinador newTreinador = Treinador(0, nomeTreinador, cidadeTreinador, pokemonInicial, pokemonInicial);
                      _dao.saveTreinador(newTreinador).then((id) => Navigator.pop(context),);
                    }
                  }
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
