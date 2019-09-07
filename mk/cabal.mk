
CABAL_CMD=cabal

CABAL_VERSION := $(shell $(CABAL_CMD) --numeric-version | cut -d. -f1-2)

# Amazing hack to do =< comparison (due to https://stackoverflow.com/questions/3437160).
# Relies on there being no cabal 2.10.x or above.
ifeq ("2.4","$(word 1,$(sort 2.4 $(CABAL_VERSION)))")
	CABAL_INSTALL_CMD=v1-install
	CABAL_BUILD_CMD=v1-build
else
	CABAL_INSTALL_CMD=install
	CABAL_BUILD_CMD=build
endif

CABAL_INSTALL_HELPER = $(CABAL_CMD) $(CABAL_INSTALL_CMD) --disable-documentation

QUICK_CABAL_INSTALL = $(CABAL_INSTALL_HELPER) --builddir=$(QUICK_BUILD_DIR)

SLOW_CABAL_INSTALL_OPTS = --builddir=$(BUILD_DIR) --enable-tests
CABAL_INSTALL           = $(CABAL_INSTALL_HELPER) \
                          $(SLOW_CABAL_INSTALL_OPTS)

QUICK_CABAL_INSTALL = $(CABAL_INSTALL_HELPER) --builddir=$(QUICK_BUILD_DIR)

SLOW_CABAL_INSTALL_OPTS = --builddir=$(BUILD_DIR) --enable-tests
CABAL_INSTALL           = $(CABAL_INSTALL_HELPER) \
                          $(SLOW_CABAL_INSTALL_OPTS)
