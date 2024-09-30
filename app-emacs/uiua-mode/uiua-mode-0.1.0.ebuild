# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

DESCRIPTION="Emacs mode for uiua, a stack-based array language"
HOMEPAGE="https://github.com/crmsnbleyd/uiua-mode"
SRC_URI="https://github.com/crmsnbleyd/uiua-mode/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-emacs/reformatter"
DEPEND="${RDEPEND}"
BDEPEND=""

pkg_postinst() {
	elog "Add"
	elog "	(require 'uiua-mode)"
	elog "to your emacs init file"
}
