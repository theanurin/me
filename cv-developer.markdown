---
layout: cv
title: TEST
---
<div class="container-block">
	<div class="sidebar">
	{% include contact.html %}
	</div>

	<div class="main">
		{% assign projects = site.data.project %}
		{% if projects %}
		<section class="projects">
			<h2 class="title">Projects</h2>
			{% for project in projects %}
				{% include project.html project=project company=company %}
			{% endfor %}
		</section>
		{% endif %}
	</div>
</div>
