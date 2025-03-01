all: test

.PHONY: test
test:
	emacs -Q -batch -l ert -l semlf.el -l semlf-tests.el \
		-eval '(ert-run-tests-batch-and-exit "^semlf-")'
