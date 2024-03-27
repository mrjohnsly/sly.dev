build:
	swift build
test:
	swift test --enable-code-coverage
preview-documentation:
	swift package --disable-sandbox preview-documentation