# weatherapp

A weather app for DVT assessment team.

## About the Weather App.

This project is developed using the clean architecture with bloc for state management.

The Lib folder consists of two folders (Core & Features) and a main.dart file.

The Core folder consist of the utils folder and a routes folder. The routes folder consist of the route file and an auto generated file. The auto_route package was used for managing routes in this application. The utils folder consist of files that can be accessed and utilised from existing and prospective app features.

The feature folder consist of named_feature folders. Using the clean architecture, I separated the folders into data and presentation folders. The data folder consists of the model and repo folders. Each folder consists of model and repo files respectively to manage the api data. The Presentation folder consists of three different folders ie pages, bloc and Widgets folders. Each folder consist of their respective files.

More so, I created the API Model class with the dio package to easily retreive data and manage API exceptions. I used the geolocator plugin to retrieve coordinates and other relevant packages.

## conclusion

The weatherapp api consists of nested json objects when retrieving data from the forecast endpoint. All data were displayed accordingly using json annotation and json serializable packages.

