# dokuwiki-sed-all-pages
Use sed for all the pages on dokuwiki

Usage:

    dokuwiki-sed-all-pages.sh <dokuwiki path> <username> <sed script> <commit message>   
    
Description:

  Apply \<sed script\> for all pages in \<dokuwiki path\> and commit changes as \<username\> with \<commit message\>
  
Example:
  
    ./dokuwiki-sed-all-pages.sh /var/www/dokuwiki my_name 's/Hate you/Love you/g' 'Changed mind'
    
Note: nkf needs to be installed for pages that have Japanese text in the name.
