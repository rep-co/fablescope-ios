format:
	@swift-format \
	--ignore-unparsable-files \
	--in-place \
	--recursive \
	fablescope
lint:
	@swift-format lint \
	--ignore-unparsable-files \
	--recursive \
	--strict \
	fablescope
