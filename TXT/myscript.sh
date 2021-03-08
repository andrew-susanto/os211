#!/bin/bash
# Andrew
# Mon 08 Mar 2021 21:53:40 WIB

echo "List of files my*.txt and my*.sh :"
echo "ls my&.txt my*.sh -la 2> /dev/null"
ls my*.txt my*.sh -la 2> /dev/null
echo ""

FILES="my*.txt my*.sh"
SHA="SHA256SUM"

echo "Removing SHA256SUM and SHA256SUM.asc"
echo "rm -f $SHA $SHA.asc"
rm -f $SHA $SHA.asc
echo ""

echo "Creating SHA256SUM..."
echo "sha256sum $FILES > $SHA"
sha256sum $FILES > $SHA
echo ""

echo "Verifying Creted SHA256SUM..."
echo "sha256sum -c $SHA"
sha256sum -c $SHA
echo ""

echo "Creating Signature File SHA256SUM.asc"
echo "gpg -o $SHA.asc -a -sb $SHA"
gpg -o $SHA.asc -a -sb $SHA
echo ""

echo "Verifying Created Signature SHA256SUM.asc.."
echo "gpg --verify $SHA.asc $SHA"
gpg --verify $SHA.asc $SHA

exit 0

# Mon 08 Mar 2021 21:53:40 WIB 
