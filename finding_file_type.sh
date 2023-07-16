for file in *; do
	file "$file"
	echo
done > out.txt
