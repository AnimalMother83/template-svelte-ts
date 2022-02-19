// import adapter from '@sveltejs/adapter-auto';
import adapter from '@sveltejs/adapter-node';
import preprocess from 'svelte-preprocess';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	// Consult https://github.com/sveltejs/svelte-preprocess
	// for more information about preprocessors
	preprocess: preprocess(),

	kit: {
		adapter: adapter({
			out: 'build',
			precompress: false,
			env: {
				host: '127.0.0.1',
				port: 3000
				// path: 'SOCKET_PATH',
				// origin: 'ORIGIN',
				// headers: {
				// 	protocol: 'PROTOCOL_HEADER',
				// 	host: 'HOST_HEADER'
				// }
			}
		}),
		vite: {
			server: {
				watch: {
					usePolling: true
				},
				hmr: {
					host: 'localhost',
					port: 3000
				}
			}
		}
	}
};

export default config;
