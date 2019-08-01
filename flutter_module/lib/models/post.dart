class Post {
  Post({
    this.title,
    this.author,
    this.imageUrl,
  });

  final String title;
  final String author;
  final String imageUrl;
}

final List<Post> posts = [
  Post(
    title: 'Candy Shop',
    author: 'Mohamed Chahin',
    imageUrl: 'https://resources.ninghao.org/images/candy-shop.jpg',
  ),
  Post(
    title: 'Childhood in a picture',
    author: 'Mohamed Chahin',
    imageUrl: 'https://resources.ninghao.org/images/childhood-in-a-picture.jpg',
  ),
  Post(
    title: 'Contained',
    author: 'Mohamed Chahin',
    imageUrl: 'https://resources.ninghao.org/images/contained.jpg',
  ),
];