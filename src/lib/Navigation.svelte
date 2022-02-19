<script lang="ts">
	import { page } from '$app/stores';
	export let logo_url: string = '';

	interface NavLink {
		title: string;
		path: string;
	}

	const nav_links: NavLink[] = [];
</script>

<nav class="navbar navbar-expand-sm navbar-light bg-light">
	<div class="container-fluid">
		{#if logo_url}
			<a class="navbar-brand" href="/">
				<img src={logo_url} alt="Logo" height="35" style="margin-bottom: 6px" />
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
			<ul class="navbar-nav justify-content-center">
				{#each nav_links as link}
					<li class="nav-item">
						<a class="nav-link" class:active={$page.url.pathname === link.path} href={link.path}
							>{link.title}</a
						>
					</li>
				{/each}
			</ul>
		</div>
	</div>
</nav>

<style>
</style>
