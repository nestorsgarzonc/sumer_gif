import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sumer_gif/gifs/bloc/gifs_bloc.dart';
import 'package:sumer_gif/gifs/models/gif_model.dart' as gm;

class GifsScreen extends StatefulWidget {
  const GifsScreen({super.key});

  @override
  State<GifsScreen> createState() => _GifsScreenState();
}

class _GifsScreenState extends State<GifsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onWrite);
  }

  @override
  void dispose() {
    _controller.removeListener(_onWrite);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Search by name',
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                  ),
                  controller: _controller,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<GifsBloc, GifsState>(
                builder: (context, state) {
                  return state.gifs.on(
                    onError: (error) => Center(child: Text(error.message)),
                    onLoading: () => const Center(child: CircularProgressIndicator()),
                    onInitial: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        BlocProvider.of<GifsBloc>(context).add(GetTrendingGifs());
                      });
                      return const Center(child: CircularProgressIndicator());
                    },
                    onData: (data) => data.isEmpty
                        ? const Center(child: Text('No gifs found :c'))
                        : MasonryGridView.builder(
                            itemCount: data.length,
                            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                            padding: const EdgeInsets.all(20),
                            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                            itemBuilder: (context, index) => GifCard(item: data[index]),
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onWrite() {
    BlocProvider.of<GifsBloc>(context).add(SearchGifs(_controller.text));
  }
}

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
