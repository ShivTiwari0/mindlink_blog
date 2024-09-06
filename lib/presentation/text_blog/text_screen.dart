import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindlink_blog/core/ui.dart';
import 'package:mindlink_blog/logic/cubits/text_cubit/text_cubit.dart';
import 'package:mindlink_blog/logic/cubits/text_cubit/text_state.dart';
import 'package:mindlink_blog/presentation/text_blog/text_details.dart';
import 'package:share_plus/share_plus.dart';

class LandingTextScreen extends StatefulWidget {
  const LandingTextScreen({super.key});

  static const routeName = "landingText";

  @override
  State<LandingTextScreen> createState() => _LandingTextScreenState();
}

class _LandingTextScreenState extends State<LandingTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Texts and Article",
          style: TextStyles.heading3,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<TextCubit, TextState>(
        builder: (context, state) {
          if (state is TextLoadingState && state.texts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TextErrorState && state.texts.isEmpty) {
            return Center(
              child: Text(state.message.toString()),
            );
          }
          return ListView.builder(
            itemCount: state.texts.length,
            itemBuilder: (context, index) {
              final product = state.texts[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 116, 113, 113)
                            .withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          Share.share(product.url);
                        },
                        icon: Icon(Icons.share)),
                    onTap: () {
                      Navigator.pushNamed(context, TextDetails.routeName,
                          arguments: product);
                    },
                    title: Text(
                      product.title,
                      style: TextStyles.heading3
                          .copyWith(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      product.description ?? "null",
                      style: TextStyles.body2
                          .copyWith(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
