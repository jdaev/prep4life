class Creator {
  String name;
  String rank;
  String imageLink;
  Creator();
  Creator fromMap(creator) {
    this.name = creator['name'];
    this.imageLink = creator['imageLink'];
    this.rank = creator['rank'];
    return this;
  }
}
