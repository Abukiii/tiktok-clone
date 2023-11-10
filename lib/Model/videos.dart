class VideoModel {
  final String videoLink;
  final String caption;
  final String time;

  VideoModel({
    required this.videoLink,
    required this.caption,
    required this.time,
  });
}

final List<VideoModel> Samplevideos = [
  VideoModel(
    videoLink:
        'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
    caption:
        'Beautiful moments captured in different angles of a model during a photo shoot. #Photography #Modeling #CaptureTheMoment hellooooo a photo shoot. #Photography #Modeling #CaptureTheMoment hellooooo a photo shoot. #Photography #Modeling #CaptureTheMoment hellooooo',
    time: '2 hours ago',
  ),
  VideoModel(
    videoLink:
        'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
    caption:
        'Spending quality time with my little daughter decorating a Christmas tree. #FamilyTime #ChristmasSpirit',
    time: '5 hours ago',
  ),
  VideoModel(
    videoLink:
        'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    caption:
        'Enjoying a sweet moment with my little one, eating marshmallows in the midst of nature. Enjoying a sweet moment with my little one, eating marshmallows in the midst of nature. Enjoying a sweet moment with my little one, eating marshmallows in the midst of nature. #Motherhood #NatureLovers',
    time: '1 day ago',
  ),
  VideoModel(
    videoLink:
        'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    caption:
        'Neon vibes with a girl posing in front of a neon sign. #NeonLights #Fashion',
    time: '3 days ago',
  ),
  VideoModel(
    videoLink:
        'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
    caption:
        'Exploring winter fashion with a cold-looking woman. Witness the beauty of cold weather style. #WinterFashion #ColdWeatherStyle',
    time: '1 week ago',
  ),
  VideoModel(
    videoLink:
        'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
    caption:
        'Relaxing by the pool, feeling the water and enjoying the sunny day. #PoolTime #Relaxation',
    time: '2 weeks ago',
  ),
  VideoModel(
    videoLink:
        'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
    caption:
        'Having a fantastic time at an amusement park, blowing bubble gum, and enjoying the thrilling rides. #AmusementParkFun #BubbleGum',
    time: '1 month ago',
  ),
];
