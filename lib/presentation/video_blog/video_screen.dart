import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindlink_blog/core/extension.dart';
import 'package:mindlink_blog/core/ui.dart';
import 'package:mindlink_blog/logic/cubits/blog_cubit/blog_cubit.dart';
import 'package:mindlink_blog/logic/cubits/video_cubit.dart/video_cubit.dart';
import 'package:mindlink_blog/logic/cubits/video_cubit.dart/video_state.dart';
import 'package:mindlink_blog/presentation/video_blog/video_player_screen.dart';
import 'package:share_plus/share_plus.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Videos",
          style: TextStyles.heading3,
        ),
        centerTitle: true,
       
      ),
      body: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          if (state is VideoLoadingState && state.videos.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is VideoErrorState && state.videos.isEmpty) {
            return Center(
              child: Text(state.message.toString()),
            );
          }
          return ListView.builder(
            itemCount: state.videos.length,
            itemBuilder: (context, index) {
              final product = state.videos[index];

              return CupertinoButton(
                onPressed: () {
                  Navigator.pushNamed(context, VideoPlayerScreen.routeName,
                      arguments: product);
                },
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CachedNetworkImage(
                          width: context.width() * 0.8 ,
                          imageUrl: product.thumbnailUrl!,
                        ), IconButton(
                        onPressed: () {
                          Share.share(product.videoUrl!);
                        },
                        icon: const Icon(Icons.share)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${product.title}",
                          style: TextStyles.body2
                              .copyWith(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

