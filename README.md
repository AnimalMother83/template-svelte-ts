# template-svelte-ts-docker

## Requirements

- node v16.14.0 (LTS)

## Development

To run development in a docker container run `npm run dev:docker`.

## Tools

### Prettier

Code formatter. Read more [here](https://prettier.io).  
Prettier is integrated to ESLint and configured to handle code formatting.

- Run: `npm run format`
- Configuration file: [.prettierrc.json](./.prettierrc.json).

See [options](https://prettier.io/docs/en/options.html).

### ESLint

Finds and fixes some problems. Read more [here](https://eslint.org).

- Run `npm run lint`.
- Configuration in [.eslintrc.cjs](./.eslintrc.cjs).

See [rules](https://eslint.org/docs/rules/).

### Typescript

Read more [here](https://www.typescriptlang.org/docs/).

- Configuration in [.tsconfig.json](./.tsconfig.json).

See [rules](https://eslint.org/docs/rules/).

### Testing

Tests are setup using [Jest](https://jestjs.io/) and Svelte Testing Library, which is a part of [Testing Library](https://testing-library.com/).

- Run tests with `npm run test`, or `npm run test:watch`.
- Configuration in [.jest.config.json](./.jest.config.json).

See [docs](https://testing-library.com/docs/).

Packages used for testing

- `jest` to run the tests.
- `ts-jest` to let you write your tests in TypeScript.
- `@testing-library/svelte` for some useful functions to test your Svelte components with.
- `@testing-library/jest-dom` for handy DOM matcher functions like `toBeInTheDocument`.
- `svelte-jester` to compile Svelte components for Jest, so that Jest can use them.
- `@types/jest` to get TS to stop complaining about Jest’s globals like `expect`.

### VSCode extensions

- [Svelte for VS Code](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode)
- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

Note: Add recommended extensions to [exensions.json](./.vscode/extensions.json).

### nvm (Node Version Manager)

- Install nvm ([instructions](https://github.com/nvm-sh/nvm)).
- Install a node version, e.g. `nvm install v16.13.2`.
- Run `nvm use` in root folder and node will be changed to version in [.nvmrc](/.nvmrc).  
  Also check out Deeper Shell Integration [here](https://github.com/nvm-sh/nvm#deeper-shell-integration).

docker run --rm -p 3000:3000 --volume :/usr/src/app/ -it upwork-ecoista
docker-compose -f docker-compose.dev.yml
