# Movie App 

## About the Project
This is a simple movie searching application powered by The Open Movie Database.

This project is built with,
* [Flutter](https://flutter.dev/) 

## Getting started
1. Clone the project
```
$ git clone https://github.com/ShanManage/movie_app.git
```
2. Install dependencies
```
$ flutter pub get
```
3. Build apk/app-image
```
$ flutter build apk
```
```
$ flutter build ipa
```

## Project Structure

    .
    ├── build                     # Build files
    ├── lib                       # Source files
    │   ├── config                # Config files
    │   ├── getx                  # GetX state manager
    │   ├── models                # Model classes
    │   ├── screens               # App screens
    │   ├── services              # Services
    │   ├── widgets               # Support widgets
    │   └── main.ts               # App entry 
    ├── tests                     # Automated tests
    ├── pubspec.yaml
    ├── pubspec.lock
    └── README.md

## GetX Architecture

Flutter GetX has been used for the state management of the application. All the data are managed in the service classes and fed into the UI. GetX bindings are used to bind the controllers in the router level. 

## Screenshots
**Home Screen**
![Screenshot_1641586397](https://user-images.githubusercontent.com/43950728/148602884-0bafa3ef-c970-4d35-8483-c201c0d32fdb.png)

**Movie Details Screen**
![Screenshot_1641586402](https://user-images.githubusercontent.com/43950728/148602957-93678557-bed5-448e-9855-a8f0369d5a5a.png)
