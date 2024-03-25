PKG_DIR=./x86_64

for pkg in "${PKG_DIR}"/*.zst
do 
	if [ -f "${pkg}".sig ]; then
		echo "Skipping signed package - $pkg"
		continue
	fi
	echo "Signing package - $pkg"
	# always "double quote" $f to avoid problems
	gpg --use-agent --output "${pkg}".sig --detach-sig "${pkg}"
	echo "Adding package - $pkg"
	( cd "${PKG_DIR}" && repo-add --verify --sign kloon.db.tar.gz "${pkg##*/}" )
done
