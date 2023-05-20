# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Jupyter Notebooks as Markdown Documents, Julia, Python or R scripts"
HOMEPAGE="
	https://pypi.org/project/jupytext/
	https://github.com/mwouts/jupytext
"
SRC_URI="https://github.com/mwouts/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=(
	"${FILESDIR}/${P}-remove-toml.patch"
)

RDEPEND="
	dev-python/nbformat
	dev-python/pyyaml
	>=dev-python/markdown-it-py-1.0.0
	dev-python/mdit-py-plugins
"
BDEPEND="
	test? (
	dev-python/flake8
	)
"

src_install() {
	distutils-r1_src_install
	mv ${D}/usr/etc ${D}/etc
}

distutils_enable_tests pytest
