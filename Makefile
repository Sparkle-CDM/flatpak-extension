ARCH?=$(shell uname -m | sed "s/^i.86$$/i686/" | sed "s/^ppc/powerpc/")
REPO?=repo
FLATPAK_REPO?=flatpak-repo
ARCH_OPTS=-o target_arch $(ARCH)
BST_BIN=bst
BST=$(BST_BIN) --colors $(ARCH_OPTS)
GPG=--gpg-sign=9A0495AF96828F9D5E032C46A9A60744BCE3F878 --gpg-homedir=gpg

build: elements
	$(BST) build flatpak-repo.bst

clean-repo:
	rm -rf $(REPO)

export-repo: clean-repo build
	$(BST) checkout flatpak-repo.bst $(REPO)

$(FLATPAK_REPO):
	ostree init --repo=$@ --mode=archive

final-repo: $(FLATPAK_REPO) | export-repo
	ostree pull-local --repo=$(FLATPAK_REPO) $(REPO)
	flatpak build-sign $(GPG) $(FLATPAK_REPO)
	flatpak build-update-repo --generate-static-deltas $(GPG) $(FLATPAK_REPO)

.PHONY: build clean-repo export
