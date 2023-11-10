class Comment {
  final String commentText;
  final String time;
  final String username;
  final String name;
  final String profilePictureUrl;
  final bool reply;

  Comment(
      {required this.commentText,
      required this.time,
      required this.username,
      required this.name,
      required this.profilePictureUrl,
      required this.reply});
}

List<Comment> Samplecomments = [
  Comment(
      commentText:
          'This is a fantastic and insightful comment. I really appreciate the effort you put into expressing your thoughts. Keep up the great work!',
      time: '2 hours ago',
      username: '@artEnthus',
      name: 'Alexandra ',
      profilePictureUrl: 'assets/images/image1.jpg',
      reply: true),
  Comment(
      commentText:
          'I completely agree with your analysis. Your comment provides a fresh perspective on the topic, and I find it quite intriguing. Looking forward to more discussions!',
      time: '1 hour ago',
      username: '@thoughtPro',
      name: 'Chris Lee',
      profilePictureUrl: 'assets/images/image2.jpg',
      reply: false),
  Comment(
      commentText:
          'Your comment reflects a deep understanding of the subject matter. It\'s evident that you\'ve done thorough research. Kudos! ',
      time: '45 minutes ago',
      username: '@research',
      name: 'Emily Rodri',
      profilePictureUrl: 'assets/images/image3.jpg',
      reply: true),
];
