//Modelo de dados
//classe Cat para dados
//para representar os dados que a Cats API retorna

class Cat {
  final String id;
  final String name;
  final String description;
  final String temperament;
  final String origin;
  final String? imageUrl; //URL da imagem pode ser nula

  Cat({
    required this.id,
    required this.name,
    required this.description,
    required this.temperament,
    required this.origin,
    this.imageUrl,
  });

  //construtor factory: não precisa criar uma nova instância
  //toda vez q ele é chamado
  //assíncrono e extraindo os valores dos atributos
  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      temperament: json['temperament'],
      origin: json['origin'],
      imageUrl: json['image']?['url'], //acessando a URL da imagem dentro do mapa 'image'
    );
  }
}