EAPI="3"
SUPPORT_PYTHON_ABIS="1"

inherit autotools bzr # python

DESCRIPTION="Gnome15 desktop service using a GNOME panel applet."
HOMEPAGE="http://www.gnome15.org/"

#EBZR_REPO_URI="lp:gnome15"
EBZR_REPO_URI="/home/cipi/src/g19/gnome15"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="=app-misc/gnome15-core-${PV}
		 dev-python/gnome-applets-python
		 dev-python/gnome-desktop-python
		 dev-python/dbus-python
		 dev-python/pygobject"
DEPEND="${RDEPEND}"


MY_SUBPACKAGE="gnome15-panel-applet"

src_prepare() {
	cd ${MY_SUBPACKAGE} && eautoreconf || die "eautoreconf failed"
}

src_configure() {
	einfo "Gnome python dependencies have a minor quirk which may cause this build to fail"
	einfo "Please make sure gnome-desktop-python is installed before gnome-applets-python"
	einfo "If you get a configure eror about gnomeapplet, re-emerge gnome-applets-python"
	einfo "after gnome-desktop-python is already emerged"

	cd ${MY_SUBPACKAGE} && econf || die "econf failed"
}

src_install() {
	cd ${MY_SUBPACKAGE} && emake DESTDIR="${D}" install || die "emake install failed"
}

# pkg_postinst() {
# 	python_mod_optimize ${PN}
# }

# pkg_postrm() {
# 	python_mod_cleanup ${PN}
# }


