## chinese-title-convertor-from-wordpress-to-octopress

Let's suppose that you're using [wordpress-to-octopress](http://import.jekyllrb.com/docs/wordpress/), with some posts' name might be unicode characters like chinese words, which will be escaped for post url after conversion. Problem is that escaped words are broken when they are accessed by url, like this:

*http://www.hanyi.name/blog/2015/02/25/%E5%93%88%E5%93%88/*

This tool is for converting post name like above to chinese pinyin form:

*http://www.hanyi.name/blog/2015/02/25/ha-ha/*

According to the chinese title in post:

title: 哈哈