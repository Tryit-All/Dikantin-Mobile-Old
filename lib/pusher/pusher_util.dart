import 'package:pusher_client/pusher_client.dart';

void sendMessage(String eventName, String message, String channelName) async {
  final appKey = "9e19e751bd7616c25541";
  final secret = "15f79358c7b376e05d79";
  final cluster = "ap1";

  PusherClient pusher = PusherClient(
      appKey,
      PusherOptions(
        cluster: cluster,
        encrypted: true,
      ));

  Channel channel = pusher.subscribe(channelName);

  await pusher.connect();

  await channel.trigger(eventName, message);

  await pusher.disconnect();
}
