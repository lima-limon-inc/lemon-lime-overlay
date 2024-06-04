# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1

DESCRIPTION="Emulator for rapid prototyping of Software Defined Networks"
HOMEPAGE="https://mininet.org/"
SRC_URI="https://github.com/mininet/mininet/archive/refs/tags/${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""
