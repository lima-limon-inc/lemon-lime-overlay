# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Device notification system using udev rules for monitoring connections"
HOMEPAGE="https://github.com/pog102/devify"
# if [[ ${PV} == 9999 ]] ; then
# 	EGIT_REPO_URI="https://github.com/pog102/devify.git"
# 	EGIT_BRANCH="main"
# 	inherit git-r3
# else
SRC_URI="https://github.com/pog102/devify/archive/refs/tags/v${PV}.tar.gz"
# fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="x11-libs/libnotify"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/different-directories.patch"
)

pkg_postinst() {
	udevadm control --reload-rules
	elog "Besides changing directory destinations, the ebuild also"
	elog "changes one thing about the script. Instead of using"
	elog "DBUS_SESSION_BUS_ADDRESS it uses DISPLAY."
	elog "Without it, it would not work in my machine. If it leads"
	elog "to unintended behavior, leave and issue on the lemon-lime-overlay"
	elog "Cheers!"
}
