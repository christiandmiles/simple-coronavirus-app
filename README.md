# Simple Coronavirus App

This is a simple flutter app designed to display the CDC guidance from https://www.cdc.gov/coronavirus/2019-ncov/prepare/prevention.html

It also includes a map showing cases for the US states with data from https://corona.lmao.ninja/states

The latest state info page provides 5 news articles for each state sourced from https://newsapi.org

It was tested on a Pixel 3 (Android) but should also work on iOS.

## Demo Video

Download the demo video at [app_demo.mp4](https://raw.githubusercontent.com/christiandmiles/simple-coronavirus-app/master/app_demo.mp4)

## Getting Started

Set your google maps api keys in `android\app\src\main\AndroidManifest.xml` and `ios\Runner\AppDelegate.swift` as per the instructions in https://codelabs.developers.google.com/codelabs/google-maps-in-flutter/

Then run: `flutter run -d <deviceName>`
