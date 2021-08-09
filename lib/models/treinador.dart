class Treinador {
  final int id;
  final String nome;
  final String cidade;
  final String starterPokemon;
  final String favPokemon;

  Treinador(
    this.id,
    this.nome,
    this.cidade,
    this.starterPokemon,
    this.favPokemon,
  );

  @override
  String toString() {
    return 'Treinador{id: $id, nome: $nome, cidade: $cidade, starterPokemon: $starterPokemon, favPokemon: $favPokemon}';
  }
}
