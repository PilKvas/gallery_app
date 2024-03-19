part of '../../presentation.dart';

@RoutePage()
class MediaScreen extends StatefulWidget implements AutoRouteWrapper {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => MediaBloc(mediaUseCase: injection()),
      child: this,
    );
  }
}

class _MediaScreenState extends State<MediaScreen> {
  final ImagePicker picker = ImagePicker();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();

  void _mediaListener(BuildContext context, MediaState state) {
    if (state.status == Status.success) {
      BaseSnackBar.showBaseSnackBar(
        context,
        context.localization.successAdd,
      );

      context.router.navigate(const GalleryRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MediaBloc>();
    return BlocConsumer<MediaBloc, MediaState>(
      listener: _mediaListener,
      builder: (context, state) {
        return BaseScaffold(
          appBar: BaseAppBar(
            actions: [
              BaseTextButton(
                child: Text(
                  context.localization.add,
                  style: const TextStyle(color: AppColors.main),
                ),
                onPressed: () => bloc.add(
                  MediaEvent.addMedia(
                    name: _name.text,
                    description: _description.text,
                  ),
                ),
                width: 50,
              ),
            ],
          ),
          body: ListView(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.lightGrey,
                ),
                height: context.screenSize.height * 0.5,
                child: BlocBuilder<MediaBloc, MediaState>(
                  builder: (context, state) {
                    if (state.imageFile != null) {
                      return Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.file(state.imageFile!),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.cancel,
                              color: AppColors.main,
                            ),
                            onPressed: () => bloc.add(
                              const MediaEvent.closeImage(),
                            ),
                          ),
                        ],
                      );
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: ImageSource.values.map(
                        (source) {
                          return BaseOutlinedButton(
                            onPressed: () async {
                              await picker.pickImage(source: source).then(
                                (value) {
                                  bloc.add(
                                    MediaEvent.pickImage(imageXFile: value),
                                  );
                                },
                              );
                            },
                            title: 'Choose from ${source.name}',
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    BaseTextField(
                      controller: _name,
                      showClearIcon: false,
                      filled: false,
                      hintText: context.localization.name,
                      errorText: state.fields[Fields.nameField]?.call(context.localization),
                    ),
                    BaseTextField(
                      controller: _description,
                      contentPadding: const EdgeInsets.only(
                        top: 8,
                        left: 8,
                        right: 8,
                        bottom: 150,
                      ),
                      textAlignVertical: TextAlignVertical.top,
                      showClearIcon: false,
                      filled: false,
                      hintText: context.localization.description,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
