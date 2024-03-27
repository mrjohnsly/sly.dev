build:
	swift build
test:
	swift test --enable-code-coverage
build-documentation:
	swift package --allow-writing-to-directory docs \
    generate-documentation --target Server \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path mrjohnsly.github.io/sly.dev \
    --output-path docs
preview-documentation:
	swift package --disable-sandbox preview-documentation