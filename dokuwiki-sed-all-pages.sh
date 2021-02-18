#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
WORK_DIR="$SCRIPT_DIR/dokuwikiworkdir"

mkdir -p $WORK_DIR
for page in `ls $1/data/pages | sed -e 's/\(.*\)\.txt/\1/;'`
do
	which nkf &>/dev/null
	if [ $? -eq 0 ]; then
		page=`echo $page | nkf -w --url-input`
	fi

	sudo $1/bin/dwpage.php -u $2 checkout "$page" "$WORK_DIR/$page"
	[ $? -ne 0 ] && continue
	sudo sed -i $3 "$WORK_DIR/$page"
	sudo $1/bin/dwpage.php -u $2 commit -m "$4" "$WORK_DIR/$page" "$page"
done
rm -rf "$WORK_DIR"
