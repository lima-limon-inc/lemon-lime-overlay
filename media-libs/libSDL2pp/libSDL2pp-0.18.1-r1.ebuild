# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ bindings/wrapper for SDL2 "
HOMEPAGE="https://github.com/libSDL2pp/libSDL2pp"
SRC_URI="https://github.com/libSDL2pp/libSDL2pp/archive/refs/tags/${PV}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

# TODO: Extra use flags, in theory the sdl2-* packages are optional
DEPEND="
	media-libs/libsdl2
	media-libs/sdl2-image
	>=media-libs/sdl2-mixer-2.6.3
	media-libs/sdl2-ttf
	"
RDEPEND="${DEPEND}"
BDEPEND="dev-build/cmake"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	cmake_src_configure
}
