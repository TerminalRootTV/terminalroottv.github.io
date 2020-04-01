#!/bin/bash
# infra.sh Infra is Not a FRAmework
echo "content-type: text/html"
echo
echo

# source head.sh
echo '<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>'
# --------------

_get_save_file(){
	_header=$(export | sed '/CONTENT_TYPE/!d;s/^.*boundary=//;s/.$//')
	_all=$(cat)
	_filename=$(echo "$_all" | sed -n -r '2!d;s/^.*filename=\"(.*)\".*/\1/;p')
	[[ -z "$_filename" ]] && echo '<meta http-equiv="refresh" content="0.1;url=../"' && return
	_file=$(echo "$_all" | sed -n "1,/$_header/p" | sed '1,4d;$d')
	_code="../assets/code"
	_filename=$(echo $_filename | sed 's/\.sh$//')
	echo "$_file" > "$_code/$_filename"

}


_generate_img(){
	_get_save_file
	
	_lines=$(wc -l "$_code/$_filename" | awk '{print $1}')
	_cols=$(wc -L "$_code/$_filename" | awk '{print $1}')
	_width=$(echo "$_cols" \* 15 | bc)
	_height=$(echo "$_lines" \* 33 | bc)
	_font="../assets/fonts/Fantasque.ttf"
	_img="../assets/img"

	sed -i "s/'/\\\'/g" "$_code/$_filename"
	convert -size "$_width"x"$_height" xc:'#262A2F' -font "$_font" -pointsize 27 -fill '#A9B1BD' -draw "text 20,40 '$(cat "$_code/$_filename")'" "$_img/$_filename.png"
	echo "	<img class='img-fluid img-thumbnail mt-3' src='$_img/$_filename.png'>"

}

_generate_img

# source footer.sh
echo '</body>
</html>'

# mkdir -p assets/{img,fonts,code}
# chown -R www-data:www-data /var/www/html
