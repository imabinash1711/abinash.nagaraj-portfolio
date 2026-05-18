
import { defineConfig } from 'astro/config';

import react from '@astrojs/react';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  integrations: [react()],

  vite: {
    plugins: [tailwindcss()],
    server: {
      watch: {
        // Watch ReScript compiled output files
        ignored: ['!**/src/rescript/**/*.mjs'],
        usePolling: false,
      },
      // Force reload when ReScript files change
      hmr: {
        overlay: true
      }
    },
    build: {
      rollupOptions: {
        output: {
          assetFileNames: (assetInfo) => {
            if (assetInfo.name?.endsWith('.css')) {
              return 'index.css';
            }
            return '[name].[hash][extname]';
          }
        }
      }
    }
  }
});