# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Emulator for rapid prototyping of Software Defined Networks"
HOMEPAGE="https://mininet.org/"
SRC_URI="https://github.com/mininet/mininet/archive/refs/tags/${PV}.tar.gz -> ${PN}.tar.gz"
S="${WORKDIR}/mininet-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

src_compile() {
	$(tc-getCC) ${CFLAGS} ${CPPFLAGS} ${LDFLAGS} -o mnexec mnexec.c || die "Compilation failed"
}

src_install() {
	dobin mnexec
}
