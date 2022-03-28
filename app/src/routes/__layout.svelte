<script lang="ts">
	import Footer from '$lib/Footer.svelte';
	import Navigation from '$lib/Navigation.svelte';

	import '../app.scss';

	const LOGO = 'logo.svg'; // filepath from 'static' folder

	const nav_links = [
		{
			title: 'Landing',
			path: '/'
		},
		{
			title: 'About',
			path: '/about'
		},
		{
			title: 'Contact',
			path: '/contact'
		}
	];
</script>

<svelte:head>
	<meta name="robots" content="noindex" />
</svelte:head>

<div class="root">
	<Navigation {nav_links} logo={LOGO} />

	<main class="pt-3 pb-3 flex-grow-1">
		<slot />
	</main>

	<Footer text={'© 2022 Template'} />
</div>

<style type="scss">
	.root {
		min-height: 100vh;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}
</style>
