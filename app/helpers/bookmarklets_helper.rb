module BookmarkletsHelper
	def bookmarklet_link_url
		# "javascript:d=document;s=d.createElement('script');s.src='http://localhost:3000/bookmarklets?url='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(d.title);d.body.appendChild(s);".html_safe
		"javascript:d=document;s=d.createElement('script');s.src='http://localhost:3000/bookmarklets/js';d.body.appendChild(s);".html_safe
	end
end
