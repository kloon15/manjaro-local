BASE_DIR=./x86_64

for pkg in "${BASE_DIR}"/*.zst
do
 
	echo "Signing package - $pkg"
	# always "double quote" $f to avoid problems
	gpg --use-agent --output "${pkg}".sig --detach-sig "${pkg}" 
done
