name: Build iOS App

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: macos-latest

    steps:
    - uses: actions/checkout@v2
    - name: Set up JDK 1.8
      uses: actions/setup-java@v1
      with:
        java-version: 1.8
    - name: Build Xamarin.iOS project
      run: |
        sudo gem install cocoapods
        cd ./YouriOSProject
        pod install
        msbuild /t:Rebuild /p:Configuration=Release /p:Platform=iPhone /p:BuildIpa=true
