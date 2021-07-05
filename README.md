# Dashtech - Epitech Intranet Mobile

# Table of content

- [1. Requirements](#1-requirements)
    * [Flutter and their tools versions](#flutter-and-their-tools-versions)
    * [Install packages dependencies](#install-packages-dependencies)
    * [Generate freezed and json_serializable files](#generate-freezed-and-json-serializable-files)
- [2. Development guidelines](#2-development-guidelines)
    * [2.1. Architecture](#21-architecture)
    * [2.2 Presentation](#22-presentation)
    * [2.3 Application](#23-application)
    * [2.4 Domain](#24-domain)
    * [2.5 Infrastructure](#25-infrastructure)
- [3. Production deploy](#3-production-deploy)
    * [3.1 IOS](#31-ios)
        + [3.1.1 Build](#311-build)
        + [3.1.2 Deploy](#312-deploy)
    * [3.2 Android](#32-android)
        + [3.2.1 Build](#321-build)
        + [3.2.2 Deploy](#322-deploy)
- [4. Git Guidelines](#4-git-guidelines)
    * [Commit Message Header](#commit-message-header)
    * [Type](#type)


# 1. Requirements

## Flutter and their tools versions

To run properly the mobile app you need to have (at least) the following flutter version.
> :warning: If the latest version is less than this version, try to change the flutter channel from **stable** to **master**.

```raw
Flutter 1.24.0-8.0.pre.374 • channel master • https://github.com/flutter/flutter.git
Framework • revision 183f0e797a (il y a 7 jours) • 2020-11-26 19:12:28 +0100
Engine • revision 20caf54969
Tools • Dart 2.12.0 (build 2.12.0-76.0.dev)
```

## Install packages dependencies

Before continue, you need to install all project dependencies:

```bash
flutter pub get
```

## Generate freezed and json_serializable files

To add missing files in the project, you need to generate these files with the following command:

```bash
flutter packages pub run build_runner
```
#  2. Development guidelines

##  2.1. Architecture

This project has been build around Domain Driven Design (DDD) concept. It means all developments are made around the Domain.
To ensure right implementation of the concept, this project uses Hexagonal architecture (Clean architecture) and Get X pattern.

Code has been split in 4 layers:
- **Domain**
- **Application**
- **Infrastructure**
- **User interface**

> **IMPORTANT**
> Interactions:
> - **Presentation** can only access **Application**
> - **Application** can only access **Domain**
> - **Infrastructure** can only access **Domain**
> - **Domain** never access any other layer

##  2.2 Presentation

This is the stuff you're used to from "unclean" Flutter architecture. You obviously need widgets to display something on the screen. These widgets then dispatch events to the Bloc and listen for states.

##  2.3 Application

To write or read data from a User Interface (UI) (like REST or GraphQL Api) we cannot access to the **Domain**.
This is why we use the **Application** layer. The aim of this layer is to interact with the **Domain**

##  2.4 Domain

Domain is the inner layer which shouldn't be susceptible to the whims of changing data sources or porting our app to Angular Dart. It will contain only the core business logic and business objects (entities). It must be totally independent of every other layer.

##  2.5 Infrastructure

he data layer consists of a Repository implementation (the contract comes from the domain layer) - one is usually for getting remote (API) data and the other for caching that data. Repository is where you decide if you return fresh or cached data, when to cache it and so on.

#  3. Production deploy

Before each build, do not forget to change the version of the application as well as the number of the build specified in `pubspec.yml`.

> The build number must be incremented by 1 on each deployment and **MUST NOT start again at 0 or be decremented**, after which future builds on the Android side will not be validated.

##  3.1 IOS

###  3.1.1 Build

The next step will be to start the build with this command:

```bash
flutter build ios --release -t lib/main.prod.dart
```

###  3.1.2 Deploy

Once the build is finished (depending on the configuration, it can sometimes take more than ten minutes), it only remains to deploy on the awning with **Fastlane**.

First of all, make sure that these environment variables are your (and correct) ones in `ios/fastlane/.env`:

```bash
# Your Apple id
APPLE_ID=""

# Team ID
ITC_TEAM_ID="120643159"
APPLE_DEVELOPER_TEAM_ID="C6APZ87U2R"
```

To deploy the application in one of the two environments, go to the ios/ folder of the project and run one of the following commands:

```bash
# For production deployment
fastlane deploy_production
```

##  3.2 Android

Deployment on Android is much simpler than iOS because no specific configuration is needed.

###  3.2.1 Build

```bash
# For production environment
flutter build appbundle --release -t lib/main.prod.dart
```

###  3.2.2 Deploy

Once the build is finished (depending on the configuration, it can sometimes take more than ten minutes), it only remains to deploy on the awning with **Fastlane**.

First of all, make sure that these environment variables are your (and correct) ones in `android/fastlane/.env`:

```bash
# Path of the publish certificates (in json) needed to push application
JSON_KEY_PATH='yourLocalPath'
```

To deploy the application in one of the two environments, go to the `android/` folder of the project and run one of the following commands:

```bash
# For production deployment
fastlane deploy_production_alpha
```

Once the deployment is complete, check on the Google Play Store platform the status of the build.

#  4. Git Guidelines

We have very precise rules over how our Git commit messages must be formatted.
This format leads to **easier to read commit history**.

Each commit message consists of a **header**, a **body**, and a **footer**.

```
<header>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

The `header` is mandatory and must conform to the [Commit Message Header](#commit-header) format.
The `body` is optional for all commits except for those of scope "docs".
When the body is required it must be at least 20 characters long.
The `footer` is optional.

Any line of the commit message cannot be longer than 100 characters.

####  <a href="commit-header"></a>Commit Message Header

```
<type>(<scope>): <short summary>
│ │ │
│ │ └─⫸ Summary in present tense. Not capitalized. No period at the end.
│ │
│ └─⫸ Commit Scope: user|auth|animations...
│
└─⫸ Commit Type: build|ci|docs|feat|fix|perf|refactor|test
```

The `<type>` and `<summary>` fields are mandatory, the `(<scope>)` field is optional.

#####  Type

Must be one of the following:
* **build**: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
* **ci**: Changes to our CI configuration files and scripts (example scopes: Circle, BrowserStack, SauceLabs)
* **docs**: Documentation only changes
* **feat**: A new feature
* **fix**: A bug fix
* **perf**: A code change that improves performance
* **refactor**: A code change that neither fixes a bug nor adds a feature
* **test**: Adding missing tests or correcting existing tests
