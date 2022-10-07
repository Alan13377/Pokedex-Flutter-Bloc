class Pokemon {
  int? id;
  String? nume;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  String? egg;
  double? spawnChance;
  double? avgSpawns;
  String? spawnTime;
  List? multipliers;
  List? weaknesses;

  Pokemon({
    this.id,
    this.nume,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'num': nume,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'candyCount': candyCount,
      'egg': egg,
      'spawnChance': spawnChance,
      'avgSpawns': avgSpawns,
      'spawnTime': spawnTime,
      'multipliers': multipliers,
      'weaknesses': weaknesses,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
        id: map['id'],
        nume: map['num'],
        name: map['name'],
        img: map['img'],
        type: map['type'].cast<String>(),
        height: map['height'],
        weight: map['weight'],
        candy: map['candy'],
        candyCount: map['candyCount'],
        egg: map['egg'],
        spawnChance: map['spawnChance'],
        avgSpawns: map['avgSpawns'],
        spawnTime: map['spawnTime'],
        multipliers: map['multipliers'],
        weaknesses: map['weaknesses'].cast<String>());
  }
}
