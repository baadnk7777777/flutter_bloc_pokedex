# flutter_pokemon_project

Using BLOC for state management.

## Introduction

This porject using BLOC for state management, fetching pokemon data show in List View infilny using BlocConsumer, and set router, and pokemonseraching function for searing pokemon in list or searing from API.

<img src="[https://your-image-url.type](https://github.com/baadnk7777777/flutter_bloc_pokedex/assets/70257547/9ce92726-3563-4826-b6c1-0b0016e57cff)" width="100" height="100">
<img src="[https://your-image-url.type](https://github.com/baadnk7777777/flutter_bloc_pokedex/assets/70257547/f5e3c985-c860-4248-93d1-d04ff8950920)" width="100" height="100">

## Getting Started

These instructions will help you set up and run the project on your local machine.

1. **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/your-project.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd your-project
    ```

3. **Install dependencies:**

    ```bash
    flutter pub get
    ```

4. **Run the application:**

    ```bash
    flutter run
    ```

## Folder Structure

- lib/
  - common/
    - config
    - constants
    - core
    - style
  - data/
    - models
    - repositories/
      - services
  - modules/
    - home_page/
      - bloc
      - models
      - repositories/
        - impl
      - views/
        - widgets
    - pokemon_detail_page/
      - bloc
      - models
      - repositories/
        - impl
      - views/
        - widgets
    - splash_page
  - router/
  - utils/
  - main.dart

## Dependencies

- [Bloc](https://pub.dev/packages/bloc)
- [Equatable](https://pub.dev/packages/equatable)
