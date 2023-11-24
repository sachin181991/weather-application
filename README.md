# weather

Weather app display the current and next some days display the weather condition / forecast.

# Setup
1. Download the flutter latest version of 3.16.0.

# Plugin
1. go_router: use to navigation
2. dio: API calling
3. get_it: Dependency injection (DI)
4. freezed: Serialization
   https://medium.com/@kamal.lakhani56/freezed-flutter-607505cf1620
5. Now run the generator / generate
   ```
    flutter packages pub run build_runner build
    dart pub run build_runner build --delete-conflicting-outputs
     
    dart run build_runner watch
   
    flutter pub run dart_code_metrics:metrics check-unused-code lib
    flutter pub run dart_code_metrics:metrics check-unused-files lib
   
    flutter update-packages --force-upgrade
   ```
6. Cubit: State management
7. flutter_dotenv: Use to define API base url
8. pretty_dio_logger: When call the API display the response in Run.
9 code structure: Clean architecture
10. Material3 support
11. Impeller support
12. .env: API point declare

