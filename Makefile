
BIN = bin/expresso
BINROOT = `npm config get binroot`
JSCOV = deps/jscoverage/node-jscoverage

test: $(BIN)
	@./$(BIN) -I lib --growl $(TEST_FLAGS) test/*.test.js

test-cov:
	@./$(BIN) -I lib --cov $(TEST_FLAGS) test/*.test.js

install: install-jscov install-expresso

uninstall:
	rm -f $(BINROOT)/expresso
	rm -f $(BINROOT)/node-jscoverage

install-jscov: $(JSCOV)
	install $(JSCOV) $(BINROOT)

install-expresso:
	install $(BIN) $(BINROOT)

$(JSCOV):
	cd deps/jscoverage && ./configure && make && mv jscoverage node-jscoverage

clean:
	@cd deps/jscoverage && git clean -fd

.PHONY: test test-cov install uninstall install-expresso install-jscov clean
