get:
	flutter pub get

build-runner:
	flutter pub run build_runner build --delete-conflicting-outputs

lint:
	flutter analyze

format:
	make lint
	flutter format --set-exit-if-changed .

run-test:
	flutter test

test-coverage:
	flutter test --coverage

generate-report:
	lcov --remove coverage/lcov.info 'lib/*_constants.dart' 'lib/di/get_it.dart' -o coverage/new_lcov.info
	genhtml coverage/new_lcov.info --output=coverage
	open coverage/index.html

test-report:
	make test-coverage
	make generate-report

clean:
	flutter clean
