import { PATH } from './config.js';

async function main() {
  console.log('Starting main...');
  console.log(PATH.split(':').join('\n'));
  console.log('Finishing main...');
}

main().catch(console.error);
