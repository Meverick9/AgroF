FROM ubuntu:22.04

# Установка базових компонентів
RUN apt-get update && apt-get install -y \
  git curl unzip xz-utils zip libglu1-mesa openjdk-17-jdk \
  && rm -rf /var/lib/apt/lists/*

# Встановлення Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable /opt/flutter

# Додавання Flutter до PATH
ENV PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Виконання doctor
RUN flutter doctor
