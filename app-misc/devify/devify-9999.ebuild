# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Device notification system using udev rules for monitoring connections"
HOMEPAGE="https://github.com/pog102/devify"
if [[ ${PV} == 9999 ]] ; then
	EGIT_REPO_URI="https://github.com/pog102/devify.git"
	EGIT_BRANCH="main"
	inherit git-r3
else
	SRC_URI="https://github.com/pog102/devify/archive/refs/tags/v${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="x11-libs/libnotify"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if [[ ${PV} == 9999 ]] ; then
		git-r3_src_unpack
	fi
}

PATCHES=(
	"${FILESDIR}/different-directories-makefile.patch"
	"${FILESDIR}/different-directories-script.patch"
)

pkg_postinst() {
	udevadm control --reload-rules
}
