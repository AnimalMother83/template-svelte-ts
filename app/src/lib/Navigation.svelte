<script lang="ts">
	import { page } from '$app/stores';

	export let logo = '';

	interface NavLink {
		title: string;
		path: string;
	}

	export let nav_links: NavLink[];
</script>

<nav class="navbar navbar-expand-md navbar-light bg-light">
	<div class="container-fluid">
		{#if logo}
			<a class="navbar-brand" href="/">
				<img src={logo} alt="Logo" height="40" />
			</a>
		{/if}

		<button
			class="navbar-toggler"
			type="button"
			data-bs-toggle="collapse"
			data-bs-target="#navbarNav"
			aria-controls="navbarNav"
			aria-expanded="false"
			aria-label="Toggle navigation"
		>
			<span class="navbar-toggler-icon" />
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav justify-content-start w-100">
				{#each nav_links as link}
					<li class="nav-item mx-1">
						<a class="nav-link" class:active={$page.url.pathname === link.path} href={link.path}
							>{link.title}</a
						>
					</li>
				{/each}
			</ul>
		</div>
	</div>
</nav>

<style type="scss">
</style>
