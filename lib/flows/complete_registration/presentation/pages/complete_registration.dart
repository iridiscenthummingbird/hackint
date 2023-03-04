import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackint/domain/shared_models/api/user_model.dart';
import 'package:hackint/flows/complete_registration/presentation/pages/cubit/complete_registration_cubit.dart';
import 'package:hackint/flows/complete_registration/presentation/widgets/group_field.dart';
import 'package:hackint/services/injectible/injectible_init.dart';

import '../../../../navigation/app_state_cubit/app_state_cubit.dart';
import '../widgets/name_field.dart';
import '../widgets/student_id_field.dart';

class CompleteRegistrationPage extends StatelessWidget {
  const CompleteRegistrationPage({
    required this.user,
    super.key,
  });

  static String path = '/';
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete registration'),
      ),
      body: BlocProvider(
        create: (context) => getIt<CompleteRegistrationCubit>()..getGroups(),
        child:
            BlocListener<CompleteRegistrationCubit, CompleteRegistrationState>(
          listener: (context, state) {
            if (state is CompleteRegistrationError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.failure.message)),
              );
            } else if (state is Completed) {
              context.read<AppStateCubit>().checkAuthStatus();
            }
          },
          child:
              BlocBuilder<CompleteRegistrationCubit, CompleteRegistrationState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: context.read<CompleteRegistrationCubit>().formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        NameField(
                          controller: context
                              .read<CompleteRegistrationCubit>()
                              .firstNameController,
                          title: 'First name',
                        ),
                        const SizedBox(height: 20),
                        NameField(
                          controller: context
                              .read<CompleteRegistrationCubit>()
                              .lastNameController,
                          title: 'Last name',
                        ),
                        const SizedBox(height: 20),
                        StudentsIdField(
                          controller: context
                              .read<CompleteRegistrationCubit>()
                              .studentsIdController,
                        ),
                        const SizedBox(height: 20),
                        GroupField(groups: state.groups),
                        const SizedBox(height: 20),
                        Material(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(4),
                          child: InkWell(
                            onTap: () async {
                              final formKey = context
                                  .read<CompleteRegistrationCubit>()
                                  .formKey;
                              if (formKey.currentState?.validate() ?? false) {
                                final user = (context
                                        .read<AppStateCubit>()
                                        .state as AuthorizedState)
                                    .user;
                                context
                                    .read<CompleteRegistrationCubit>()
                                    .completeRegistration(user.id);
                              }
                            },
                            borderRadius: BorderRadius.circular(4),
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
