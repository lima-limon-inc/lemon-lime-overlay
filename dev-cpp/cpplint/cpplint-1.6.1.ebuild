# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

DESCRIPTION="Static code checker for C++ (fork of Google's cpplint"
HOMEPAGE="https://github.com/cpplint/cpplint"
SRC_URI="https://github.com/cpplint/cpplint/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="cpplintlicense"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2


distutils_enable_tests pytest
