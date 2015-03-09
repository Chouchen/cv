function goDecoding() {
	if (window.InstallTrigger) {

		var decode = document.getElementsByName("decode"), inner;

		for (var i=0, c=decode.length; i<c; i++) {
			inner = decode[i].textContent;

			if (inner || (inner.indexOf('&') != -1 && inner.indexOf('<') != -1)) {
				decode[i].innerHTML = inner; // \o/
			}
		}
	}
}