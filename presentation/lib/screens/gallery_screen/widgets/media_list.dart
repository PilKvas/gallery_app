part of '../../../presentation.dart';

class MediaList extends StatefulWidget {
  final bool isNew;

  const MediaList({required this.isNew, super.key});

  @override
  State<MediaList> createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final _debouncer = Debouncer(milliseconds: 500);
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _focusNode.addListener(
      () {
        setState(
          () {
            _isFocused = _focusNode.hasFocus;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
      context.read<GalleryBloc>().add(
            GalleryEvent.galleryListLoaded(isNew: widget.isNew),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GalleryBloc>();

    return RefreshIndicator(
      onRefresh: () async {
        return bloc.add(
          GalleryEvent.galleryListLoaded(
            isNew: widget.isNew,
            refresh: true,
          ),
        );
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (context, state) {
            return Column(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: AppColors.hightLightColor,
                  ),
                  child: TextField(
                    focusNode: _focusNode,
                    controller: _textController,
                    onChanged: (text) {
                      _debouncer.run(() {
                        bloc.add(
                          GalleryEvent.galleryListLoaded(
                            isNew: widget.isNew,
                            name: text,
                            refresh: true,
                          ),
                        );
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(238, 238, 239, 1),
                      contentPadding: const EdgeInsets.all(8),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(188, 188, 188, 1),
                        size: 25,
                      ),
                      suffixIcon: IconButton(
                          splashRadius: 5,
                          icon: Icon(
                            Icons.cancel,
                            color: _isFocused ? AppColors.hightLightColor : Colors.grey,
                          ),
                          onPressed: () {
                            _textController.clear();
                            bloc.add(
                              GalleryEvent.galleryListLoaded(
                                isNew: widget.isNew,
                                name: _textController.text,
                                refresh: true,
                              ),
                            );
                          }),
                      hintText: S.of(context).searchField,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                if (state.status == Status.loading && !state.isPaginating) ...[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 2),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomProgressIndicator(),
                          Text('Loading...'),
                        ],
                      ),
                    ),
                  )
                ],
                if (state.item.isNotEmpty) ...[
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.item.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(
                            GalleryItemRoute(
                              imageInfo: state.item[index],
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: const Offset(0, 3),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: FadeInImage.memoryNetwork(
                                imageErrorBuilder: (context, error, trace) {
                                  return const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  );
                                },
                                placeholder: kTransparentImage,
                                image: state.item[index].image?.name ?? '',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  if (state.status == Status.loading && state.isPaginating) ...[
                    const Center(
                      child: CustomProgressIndicator(),
                    ),
                  ]
                ],
                if (state.status != Status.loading && state.item.isEmpty) ...[
                  SizedBox(
                    height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.search,
                          size: 100,
                          color: Colors.grey,
                        ),
                        Text(
                          S.of(context).noSearch,
                          style: Theme.of(context).textTheme.searchError,
                        ),
                      ],
                    ),
                  )
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}
