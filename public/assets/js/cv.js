var modeSwitchCheckbox = document.getElementById('mode-switch-checkbox')
var modeSwitchIcon = document.getElementById('mode-switch-icon');
if (modeSwitchCheckbox !== null && modeSwitchIcon !== null) {

	function setDarkMode(darkModeFlag) {
		if (darkModeFlag) {
			document.documentElement.setAttribute('data-theme', 'dark');
			modeSwitchIcon.className = "fa fa-sun-o";
		} else {
			document.documentElement.setAttribute('data-theme', 'light');
			modeSwitchIcon.className = "fa fa-moon-o";
		}
	}

	var initDarkMode = null;
	try { initDarkMode = localStorage.getItem("darkMode"); } catch (e) { console.error(e); }
	switch(initDarkMode) {
		case "true": initDarkMode = true; break;
		default: initDarkMode = false; break;
	}

	setDarkMode(initDarkMode);
	
	modeSwitchCheckbox.addEventListener('change', function () {
		setDarkMode(this.checked);
		try { localStorage.setItem("darkMode", this.checked); } catch (e) { console.error(e); }
	});
}
