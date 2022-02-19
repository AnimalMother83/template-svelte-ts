<script lang="ts">
	import '../app.scss';
	import Navigation from '../lib/Navigation.svelte';
	import Footer from '../lib/Footer.svelte';
</script>

<svelte:head>
	<meta name="robots" content="noindex" />
</svelte:head>

<div class="root">
	<Navigation />

	<main class="pt-3 pb-3 flex-grow-1">
		<slot />
	</main>

	<Footer text={'© 2022 Ecoista'} />
</div>

<style>
	.root {
		min-height: 100vh;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}
</style>
