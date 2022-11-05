import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sumer_gif/gifs/bloc/gifs_bloc.dart';
import 'package:sumer_gif/gifs/ui/widgets/gif_card.dart';
import 'package:sumer_gif/widgets/loading_widget.dart';

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
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.75, 1],
            colors: [Colors.white, Colors.grey],
          ),
        ),
        child: SafeArea(
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
              const GifsBody(),
            ],
          ),
        ),
      ),
    );
  }

  void _onWrite() {
    BlocProvider.of<GifsBloc>(context).add(SearchGifs(_controller.text));
  }
}

class GifsBody extends StatelessWidget {
  const GifsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GifsBloc, GifsState>(
        builder: (context, state) => state.gifs.on(
          onError: (error) => Center(child: Text(error.message)),
          onLoading: () => const LoadingWidget(),
          onInitial: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              BlocProvider.of<GifsBloc>(context).add(GetTrendingGifs());
            });
            return const LoadingWidget();
          },
          onData: (data) => state.isEmpty
              ? const Center(child: Text('No gifs found :c'))
              : MasonryGridView.builder(
                  itemCount: data.length,
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.all(20),
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) => GifCard(item: data[index]),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
        ),
      ),
    );
  }
}
