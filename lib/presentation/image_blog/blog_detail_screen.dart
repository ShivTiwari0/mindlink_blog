import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:mindlink_blog/core/ui.dart';
import 'package:mindlink_blog/data/model/blog_model.dart';


class BlogDetailScreen extends StatefulWidget {
  final BlogModel blog;
  const BlogDetailScreen({super.key, required this.blog});

  static const routeName = "BlogDetail";

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.blog.title ?? "No title found"),
       
     
         
        
      ),
      body: SafeArea(
        child: ListView( 
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl: widget.blog.imageUrl!,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.blog.title}",
                    style: TextStyles.heading3, 
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${widget.blog.id}",
                    style: TextStyles.body1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
