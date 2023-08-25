# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

DESCRIPTION="Write snippets of code in C++, Python, Ruby, and others as documentation and execute them as regression tests."
HOMEPAGE="https://github.com/byexamples/byexample"
SRC_URI="https://github.com/byexamples/byexample/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="cpplintlicense"
SLOT="0"
KEYWORDS="~amd64"

IUSE="doc"

DEPEND="
	>=dev-python/pexpect-4
	<dev-python/pexpect-5
	>=dev-python/appdirs-1.4.3
	<dev-python/appdirs-2
	>=dev-python/pyte-0.8.0
	>=dev-python/tqdm-4
	>=dev-python/pygments-2
	"
#tqdm-4 and pygments-2 are theoreticall option, but I got an error when I tried
#to use the program without them.

RDEPEND="${DEPEND}"
BDEPEND="
	doc? ( || ( app-text/pandoc-bin app-text/pandoc ) )
	"

PATCHES=(
	"${FILESDIR}/doNotInstallLicense.patch"
)

src_prepare() {
	if use !doc; then
		PATCHES+=( "${FILESDIR}/removeDocumentation.patch" )
	fi
	default
}

distutils_enable_tests pytest
