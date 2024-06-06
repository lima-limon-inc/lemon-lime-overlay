# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_EXT=1
inherit distutils-r1

DESCRIPTION="Plot on map projections "
HOMEPAGE="https://matplotlib.org/basemap/stable/"
SRC_URI="https://github.com/matplotlib/basemap/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/basemap-${PV}/packages/basemap_data_hires"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"

PATCHES=(
	"${FILESDIR}/namespace-change.patch"
)

DEPEND="${RDEPEND}"
BDEPEND="
	dev-python/cython
"
