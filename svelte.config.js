import adapter from '@sveltejs/adapter-node';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		adapter: adapter({
			out: 'build'  // Asegúrate de que este directorio coincida con el que estás copiando en el Dockerfile
		})
	}
};

export default config;

