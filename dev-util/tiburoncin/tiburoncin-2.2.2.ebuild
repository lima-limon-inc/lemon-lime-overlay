# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit toolchain-funcs

DESCRIPTION="Small man in the middle tool to inspect the traffic between two endpoints A and B"
HOMEPAGE="https://github.com/eldipa/tiburoncin"
SRC_URI="https://github.com/eldipa/tiburoncin/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=(
	"${FILESDIR}/removeTest.patch"
)

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake CC="$(tc-getCC)" \
		CPPFLAGS="${CPPFLAGS}" \
		CFLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}"
}

src_install() {
	dobin ${PN}
}
