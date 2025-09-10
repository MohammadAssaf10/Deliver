#!/bin/bash

# Create Feature Script
# Usage: ./create_feature.sh "feature_name"

# Check if feature name is provided
if [ $# -eq 0 ]; then
    echo "Error: Feature name is required"
    echo "Usage: ./create_feature.sh \"feature_name\""
    exit 1
fi

RAW_FEATURE_NAME="$1"

input="$1"

# Convert to camelCase
FEATURE_NAME=$(echo "$input" | awk -F_ '{
    for(i=1;i<=NF;i++) {
        if(i==1) printf("%s", $i)
        else printf("%s%s", toupper(substr($i,1,1)), substr($i,2))
    }
    printf("\n")
}')

echo "$FEATURE_NAME"

# Check if the feature name is provided
if [ -z "$RAW_FEATURE_NAME" ]; then
    echo "Error: Feature name cannot be empty"
    echo "Usage: ./create_feature.sh \"feature_name\""
    exit 1
fi

echo "Creating feature: $RAW_FEATURE_NAME"

# Store the current directory
CURRENT_DIR=$(pwd)

# Create the feature structure manually
echo "Creating feature structure..."

cd lib/
cd features/
# Create the main feature directory
mkdir -p "$RAW_FEATURE_NAME"

# Create the standard feature structure
mkdir -p "$RAW_FEATURE_NAME/data"
mkdir -p "$RAW_FEATURE_NAME/data/data_sources"
mkdir -p "$RAW_FEATURE_NAME/data/models"
mkdir -p "$RAW_FEATURE_NAME/data/repositories"

mkdir -p "$RAW_FEATURE_NAME/domain"
mkdir -p "$RAW_FEATURE_NAME/domain/entities"
mkdir -p "$RAW_FEATURE_NAME/domain/repositories"

mkdir -p "$RAW_FEATURE_NAME/presentation"
mkdir -p "$RAW_FEATURE_NAME/presentation/bloc"
mkdir -p "$RAW_FEATURE_NAME/presentation/pages"
mkdir -p "$RAW_FEATURE_NAME/presentation/widgets"

# Create basic files
echo "Creating basic files..."

# Create bloc files
cat > "$RAW_FEATURE_NAME/presentation/bloc/${RAW_FEATURE_NAME}_bloc.dart" << EOF
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/${RAW_FEATURE_NAME}_repository.dart';
import '${RAW_FEATURE_NAME}_event.dart';
import '${RAW_FEATURE_NAME}_state.dart';


@injectable
class ${FEATURE_NAME^}Bloc extends Bloc<${FEATURE_NAME^}Event, ${FEATURE_NAME^}State> {
  final ${FEATURE_NAME^}Repository _${FEATURE_NAME}Repository;
  ${FEATURE_NAME^}Bloc(this._${FEATURE_NAME}Repository) : super(${FEATURE_NAME^}State.initial()) {
    on<${FEATURE_NAME^}Event>((event, emit) {
      // TODO: implement event handlers
    });
  }
}
EOF

cat > "$RAW_FEATURE_NAME/presentation/bloc/${RAW_FEATURE_NAME}_event.dart" << EOF
import 'package:built_value/built_value.dart';

part '${RAW_FEATURE_NAME}_event.g.dart';

abstract class ${FEATURE_NAME^}Event {}

abstract class Get${FEATURE_NAME^} extends ${FEATURE_NAME^}Event implements Built<Get${FEATURE_NAME^}, Get${FEATURE_NAME^}Builder> {
  

  Get${FEATURE_NAME^}._();
  factory Get${FEATURE_NAME^}([void Function(Get${FEATURE_NAME^}Builder) updates]) = _\$Get${FEATURE_NAME^};
}
EOF

cat > "$RAW_FEATURE_NAME/presentation/bloc/${RAW_FEATURE_NAME}_state.dart" << EOF
import 'package:built_value/built_value.dart';

part '${RAW_FEATURE_NAME}_state.g.dart';

abstract class ${FEATURE_NAME^}State implements Built<${FEATURE_NAME^}State, ${FEATURE_NAME^}StateBuilder> {
  

  ${FEATURE_NAME^}State._();
  factory ${FEATURE_NAME^}State([void Function(${FEATURE_NAME^}StateBuilder) updates]) = _\$${FEATURE_NAME^}State;

  factory ${FEATURE_NAME^}State.initial() => ${FEATURE_NAME^}State();
}

EOF

# Create main page
cat > "$RAW_FEATURE_NAME/presentation/pages/${RAW_FEATURE_NAME}_page.dart" << EOF
import 'package:flutter/material.dart';

class ${FEATURE_NAME^}Page extends StatelessWidget {
  const ${FEATURE_NAME^}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

EOF

# Create repository interface
cat > "$RAW_FEATURE_NAME/domain/repositories/${RAW_FEATURE_NAME}_repository.dart" << EOF
import '../../../../core/repositories/base_repository.dart';

abstract class ${FEATURE_NAME^}Repository extends BaseRepository {
  // TODO: Define repository methods
}
EOF

# Create repository implementation
cat > "$RAW_FEATURE_NAME/data/repositories/${RAW_FEATURE_NAME}_repository_impl.dart" << EOF
import 'package:injectable/injectable.dart';

import '../../../../core/repositories/base_repository_impl.dart';
import '../../domain/repositories/${RAW_FEATURE_NAME}_repository.dart';
import '../data_sources/${RAW_FEATURE_NAME}_remote_data_source.dart';

@LazySingleton(as: ${FEATURE_NAME^}Repository)
class ${FEATURE_NAME^}RepositoryImpl extends BaseRepositoryImpl
    implements ${FEATURE_NAME^}Repository {

  final ${FEATURE_NAME^}RemoteDataSource _${FEATURE_NAME}RemoteDataSource;
  ${FEATURE_NAME^}RepositoryImpl(super._networkInfo, this._${FEATURE_NAME}RemoteDataSource);
}
EOF

# Create remote data source interface
cat > "$RAW_FEATURE_NAME/data/data_sources/${RAW_FEATURE_NAME}_remote_data_source.dart" << EOF
import '../../../../core/data_source/remote/base_remote_data_source.dart';

abstract class ${FEATURE_NAME^}RemoteDataSource extends BaseRemoteDataSource {
  // TODO: Define remote data source methods
}
EOF

# Create remote data source implementation
cat > "$RAW_FEATURE_NAME/data/data_sources/${RAW_FEATURE_NAME}_remote_data_source_impl.dart" << EOF
import 'package:injectable/injectable.dart';
import '../../../../core/data_source/remote/base_remote_data_source_impl.dart';
import '${RAW_FEATURE_NAME}_remote_data_source.dart';

@LazySingleton(as: ${FEATURE_NAME^}RemoteDataSource)
class ${FEATURE_NAME^}RemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements ${FEATURE_NAME^}RemoteDataSource {}
EOF

# Create entity
cat > "$RAW_FEATURE_NAME/domain/entities/${RAW_FEATURE_NAME}_entity.dart" << EOF
import 'package:equatable/equatable.dart';

class ${FEATURE_NAME^}Entity extends Equatable {
  final int id;
  final String name;

  const ${FEATURE_NAME^}Entity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
EOF

cd ../../
make generate

echo "Feature '$RAW_FEATURE_NAME' created successfully!"

