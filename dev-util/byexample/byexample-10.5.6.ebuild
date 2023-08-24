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

DEPEND="
	>=dev-python/pexpect-4
	<dev-python/pexpect-5
	>=dev-python/appdirs-1.4.3
	<dev-python/appdirs-2
	>=dev-util/termscraper-0.10
	<dev-util/termscraper-0.11
	>=dev-python/bracex-2.1.0
	<dev-python/bracex-3
	"
	# >=dev-python/importlib-resources-5.5
	# <dev-python/importlib-resources-6
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/doNotInstallLicense.patch"
)


# the following are the required dependencies
# without them, we cannot run byexample
# NOTE: keep this list in sync with byexample/cmdline.py
# required_deps=[
#     'pexpect>=4,<5',     # pexpect 4.x.x required
#     'appdirs>=1.4.3,<2', # appdirs 1.4.x (x >= 3) required
#     'termscraper>=0.10,<0.11', # termscraper 0.10.x
#     'bracex>=2.1.0,<3',  # bracex 2.x required (with x >= 1)
#     'importlib-resources>=5.5.0,<6.0.0', # importlib-resources 5.y.x (y >= 5)
#     ]

# # these, on the other hand, are optional nice to have
# # dependencies. we'll install them by default but if they
# # are not present, byexample will run normally.
# # NOTE: keep this list in sync with byexample/cmdline.py
# nice_to_have_deps=[
#     'tqdm>=4,<5',     # tqdm 4.x.x required
#     'pygments>=2,<3', # pygments 2.x.x required
#     'argcomplete>=2.0.0,<2.1.0' # argcomplete 2.x.x required
#     ]

distutils_enable_tests pytest
