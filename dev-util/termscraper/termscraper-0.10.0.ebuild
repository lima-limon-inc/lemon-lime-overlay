# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

DESCRIPTION="Simple VTXXX-compatible terminal emulator scraper."
HOMEPAGE="https://github.com/byexamples/termscraper"
SRC_URI="https://github.com/byexamples/termscraper/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	~dev-python/wcwidth-0.2.6
	"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/doNotInstallLicense.patch"
)

distutils_enable_tests pytest
