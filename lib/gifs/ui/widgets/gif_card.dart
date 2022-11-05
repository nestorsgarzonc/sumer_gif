import 'package:flutter/material.dart';
import 'package:sumer_gif/gifs/models/gif_model.dart' as gm;

class GifCard extends StatefulWidget {
  const GifCard({required this.item, Key? key}) : super(key: key);

  final gm.GifModel item;

  @override
  State<GifCard> createState() => _GifCardState();
}

class _GifCardState extends State<GifCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.item.images.downsized.height,
      child: Stack(
        children: [
          Image.network(
            widget.item.images.downsized.url,
            height: widget.item.images.downsized.height,
            fit: BoxFit.fitHeight,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: progress.expectedTotalBytes != null
                      ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: InkWell(
              onTap: () => setState(() => _isFavorite = !_isFavorite),
              child: Container(
                decoration: BoxDecoration(
                  color: _isFavorite ? Colors.red : Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(5),
                child: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.white : Colors.red,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
