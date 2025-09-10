import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/presentation/cubit/app_cubit.dart';
import '../../../../core/di/di.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/widget/loader.dart';
import '../bloc/conversation_bloc.dart';
import '../bloc/conversation_state.dart';

class ConversationPage extends StatelessWidget {
  final int tripId;
  const ConversationPage({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.paddingOf(context).top + 35,
        title: Text('Conversation', style: TextStyles.font25DarkWhiteBold),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          color: ColorsManager.customWhite,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: ColorsManager.darkWhite),
        ),
      ),
      body: BlocBuilder<ConversationBloc, ConversationState>(
        builder: (context, state) {
          return state.status.isLoading
              ? const Loader(color: ColorsManager.customWhite)
              : state.status.isSuccess
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.messages.length,
                        reverse: true,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemBuilder: (context, index) {
                          final bool isSender =
                              state.messages[index].senderId ==
                              getIt<AppCubit>().state.profile!.userId;
                          return Align(
                            alignment: isSender
                                ? AlignmentDirectional.centerEnd
                                : AlignmentDirectional.centerStart,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 220),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 7,
                                ),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: ColorsManager.customWhite,
                                  borderRadius: isSender
                                      ? const BorderRadiusDirectional.only(
                                          topEnd: Radius.circular(16),
                                          topStart: Radius.circular(16),
                                          bottomStart: Radius.circular(16),
                                        )
                                      : const BorderRadiusDirectional.only(
                                          topEnd: Radius.circular(16),
                                          topStart: Radius.circular(16),
                                          bottomEnd: Radius.circular(16),
                                        ),
                                ),
                                child: Text(
                                  state.messages[index].message,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: ColorsManager.darkGrey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: context
                                    .read<ConversationBloc>()
                                    .messageController,
                                validator: (value) => null,
                                hintText: 'message',
                                onFieldSubmitted: (value) {
                                  if (!value.trim().nullOrEmpty()) {
                                    context
                                        .read<ConversationBloc>()
                                        .sendMessage(tripId, value);
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 5),
                            IconButton(
                              onPressed: () {
                                if (!context
                                    .read<ConversationBloc>()
                                    .messageController
                                    .text
                                    .trim()
                                    .nullOrEmpty()) {
                                  context.read<ConversationBloc>().sendMessage(
                                    tripId,
                                    context
                                        .read<ConversationBloc>()
                                        .messageController
                                        .text,
                                  );
                                }
                              },
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  ColorsManager.customWhite,
                                ),
                                shape: WidgetStatePropertyAll(CircleBorder()),
                              ),
                              iconSize: 28,
                              color: ColorsManager.darkGrey,
                              icon: const Icon(Icons.send_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
