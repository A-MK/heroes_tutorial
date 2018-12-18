class Hero {
  final int id;
  final String name;
  Hero(this.id,this.name);

  Hero copyWith(num id, String name){
    return Hero(
      id ?? this.id,
      name ?? this.name
    );
  }
}