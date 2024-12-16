# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Amateur radio logbook software"
HOMEPAGE="https://github.com/foldynl/QLog"
SRC_URI="https://github.com/foldynl/QLog/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/QLog-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	media-libs/hamlib
	dev-qt/qtwebsockets
	dev-qt/qtwebengine
	dev-qt/qtcharts
	dev-qt/qtserialport
	dev-libs/qtkeychain
"
DEPEND="${RDEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${PN}-pro-lib-dir.patch"
)

src_configure() {
	eqmake6 QLog.pro
}

src_install() {
	emake INSTALL_ROOT="${D}" install

}
