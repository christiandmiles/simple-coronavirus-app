# Simple Coronavirus App

This is a simple flutter app designed to display the CDC guidance from https://www.cdc.gov/coronavirus/2019-ncov/prepare/prevention.html

It also includes a map showing confirmed cases as listed in https://github.com/CSSEGISandData/COVID-19/blob/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv

It was tested on a Pixel 3 (Android) but should also work on iOS.

## Demo Video

Download the demo video at [app_demo.mp4](https://raw.githubusercontent.com/christiandmiles/simple-coronavirus-app/master/app_demo.mp4)

## Getting Started

Set your google maps api keys in `android\app\src\main\AndroidManifest.xml` and `ios\Runner\AppDelegate.swift` as per the instructions in https://codelabs.developers.google.com/codelabs/google-maps-in-flutter/

Then run: `flutter run -d <deviceName>`
