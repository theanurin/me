window.addEventListener("umami:ready", function () {
	if (window.umami && typeof window.umami.track === "function") {
		const umami = window.umami;

		function getCurrentTheme() {
			const checkboxElement = document.getElementById("mode-switch-checkbox");
			const theme =
				checkboxElement !== null
					? checkboxElement.checked
						? "dark"
						: "light"
					: "unknown";
			return theme;
		}

		// "cv-theme-change" event
		{
			const checkboxElement = document.getElementById("mode-switch-checkbox");
			if (checkboxElement !== null) {
				checkboxElement.addEventListener("change", function (event) {
					const theme = event.target.checked ? "dark" : "light";
					umami.track("cv-theme-change", {
						page_path: window.location.pathname,
						lang: document.documentElement.lang,
						theme,
					});
				});
			}
		}

		// "cv-print" event
		window.addEventListener("beforeprint", () => {
			umami.track("cv-print", {
				page_path: window.location.pathname,
				lang: document.documentElement.lang,
				theme: getCurrentTheme(),
			});
		});

		// "cv-scroll-depth" event
		{
			let scroll40Sent = false;
			let scroll90Sent = false;
			window.addEventListener(
				"scroll",
				function () {
					if (scroll40Sent && scroll90Sent) return;

					const defaultProps = {
						page_path: window.location.pathname,
						lang: document.documentElement.lang,
						theme: getCurrentTheme(),
					};

					const documentElement = document.documentElement;
					const bodyElement = document.body;
					const st = "scrollTop";
					const sh = "scrollHeight";

					const percent =
						((documentElement[st] || bodyElement[st]) /
							((documentElement[sh] || bodyElement[sh]) -
								documentElement.clientHeight)) *
						100;

					if (!scroll40Sent && percent > 40) {
						umami.track("cv-scroll-depth", {
							...defaultProps,
							percentage: "40%",
						});
						scroll40Sent = true;
					}

					if (!scroll90Sent && percent > 90) {
						umami.track("cv-scroll-depth", {
							...defaultProps,
							percentage: "90%",
						});
						scroll90Sent = true;
					}
				},
				{ passive: true },
			);
		}
	}
});
