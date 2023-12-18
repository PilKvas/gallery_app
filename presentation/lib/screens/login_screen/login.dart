library login;

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:presentation/generated/l10n.dart';

import 'package:presentation/presentation.dart';

part 'bloc/authentication_event.dart';

part 'bloc/authentication_state.dart';

part 'login.freezed.dart';

part 'bloc/authentication_bloc.dart';
