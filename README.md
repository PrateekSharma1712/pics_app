# PicSum App

## Dart and Flutter version

This app uses the following Dart and Flutter version - `flutter --version`:

```sh
Flutter 3.0.5 • channel stable • <https://github.com/flutter/flutter.git>
Framework • revision f1875d570e (2 weeks ago) • 2022-07-13 11:24:16 -0700 Engine • revision
e85ea0e79c Tools • Dart 2.17.6 • DevTools 2.12.2
```

## How to run

The app will show error initially. So, run `make get` to install dependencies. It is tested on iPhone and an Android phone in portrait mode. It works well with landscape as well but it's UI is not altered based on orientation.

Use **Makefile** commands to run series of commands. For example:

**`build-runner`**: To generate files for generators
**`make test-report`**: This command is handy to run tests with coverage and generate lcov report and open that in default browser. For this, lcov must be installed - `brew install lcov` should install it.
**`make run-test`**: To run tests without coverage
**`make test-coverage`**: To run tests with coverage
**`make format`**: This command analyzes and formats all dart files

## Architecture

App follows clean architecture principles with mainly three layers - data, domain and presentation.
**Note:** In codebase, I have used some acronyms as suffix to some files and classes like -
**Remote Model: rm**
**Domain Model: dm**
**Data Source: ds**

## Main requirements covered

1. Load Grid with pics
2. Infinite pagination
3. Navigate to a pic details screen
4. Full screen pic

## Extensions

1. **Unit Tests**: **100%** coverage
2. **Cache Image**: Using library for caching the images (default implementation)
3. **Scroll to Top**: There is a Floating action button on pics list, on tap of which screen scrolls to the top.

## Important note

The response headers of `https://picsum.photos/v2/list` GET API are:

1. **cf-cache-status: DYNAMIC** - image is not cached from server
2. **Cache-Control: no-cache, no-store, must-revalidate** - no max age here

These response headers indicate that there is almost no chance that server caches at their end. So, I found it less optimal to enable caching on client as well as it would not be accurate. The `flutter_cache_manager` plugin caches based on these headers and defaults to 7 days if these are not present.

On the other hand, the `https://picsum.photos/id` API to get image returns with a `max-age` Cache-Control header, so it made sense to use `CachedNetworkImage` widget.

## Libraries used

**flutter_bloc**: State managememt
**freezed**: For generating fromJson, elegantly handling bloc states
**get_it**: service locator
**dartz**: To return either success or error from data layers
**cached_network_image**: To load images from cache
**rxdart**: To debounce user scroll event and efficiently paginate
**shimmer**: Animated loaders for image
**mocktail**: for mocking objects
**mockingJay**: for mocking navigator
**bloc_test**: to test blocs
