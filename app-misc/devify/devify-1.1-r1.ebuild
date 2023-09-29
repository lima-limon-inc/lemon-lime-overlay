# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit udev

DESCRIPTION="Device notification system using udev rules for monitoring connections"
HOMEPAGE="https://github.com/pog102/devify"
# if [[ ${PV} == 9999 ]] ; then
# 	EGIT_REPO_URI="https://github.com/pog102/devify.git"
# 	EGIT_BRANCH="main"
# 	inherit git-r3
# else
SRC_URI="https://github.com/pog102/devify/archive/refs/tags/V${PV}.tar.gz"
# fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-libs/libnotify
	media-libs/libcanberra
	"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/different-directories-makefile-1.patch"
	"${FILESDIR}/different-directories-script-1.patch"
	"${FILESDIR}/different-path.patch"
)

pkg_postinst() {
 	udev_reload
	elog "Besides changing directory destinations, the ebuild also"
	elog "changes one thing about the script: Instead of using"
	elog "DBUS_SESSION_BUS_ADDRESS it uses DISPLAY."
	elog "I was not able to make the script work in any other way. If it leads"
	elog "to unintended behavior, make an issue on the lemon-lime-overlay:"
	elog "https://github.com/lima-limon-inc/lemon-lime-overlay"
	elog "Cheers!"
}

pkg_postrm() {
	udev_reload
}
