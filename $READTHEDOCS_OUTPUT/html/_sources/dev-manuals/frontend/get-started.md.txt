# Get Started

This document will contain a short overview of the technologies used in this project as well as a short decription of how to setup your enviroment to start coding.

## Technologies used

For this project we use the following technologies:
- [Next.js](https://nextjs.org/)
- [Tailwind CSS](https://tailwindcss.com/)
- [TypeScript](https://www.typescriptlang.org/)
- [pnpm](https://pnpm.io/)
Using the ```npm install``` command after installing [Node.js](https://nodejs.org/en), should ensure that all needed packages and technologies are installed.

### Next.js
Next.js is a framework that is based on React. It allows you to create full-stack Web applications by extending the latest React features, and integrating powerful Rust-based JavaScript tooling for the fastest builds.
The system requirements are the follwing: 
- [Node.js](https://nodejs.org/en/download) 16.8.0 or newer
- A Linux, Mac or Windows system 
To create an app you can use either the automatic setup or the manual setup.
Because this project has already setup everything important that is handeled by the automatic setup, please follow the manual setup which is:
```
npm install next react react-dom
# or
yarn add next react react-dom
# or
pnpm add next react react-dom
``` 
To learn more about Next.js, please read either the [documentation](https://nextjs.org/docs) or learn it with their interactive [learn course](https://nextjs.org/learn/basics/create-nextjs-app).

### Tailwind CSS
Tailwind CSS functions as a CSS framework and makes working with CSS easier and faster than with plain CSS. It is fast, flexible, and reliable — with zero-runtime.
You can install it via ```npm install -D tailwindcss```. All other steps like configuring the template path or adding Tailwind to the CSS should be already taken care of.
If you use VSCode please consider using the *Tailwind CSS IntelliSense* to avoid triggering warnings or errors where the Tailwind rules aren’t recognized.
To learn more about Tailwind CSS or if you want to look up code examples for your coding please look at the [documentation](https://tailwindcss.com/docs/utility-first).

### TypeScript
TypeScript is a strongly typed programming language that builds on JavaScript, giving you better tooling at any scale. It adds additional syntax to JavaScript to support a tighter integration with your editor. Catch errors early in your editor. TypeScript code converts to JavaScript, which runs anywhere JavaScript runs: In a browser, on Node.js or Deno and in your apps. It understands JavaScript and uses type inference to give you great tooling without additional code.
To install TypeScript you can use `npm install -g typescript`.
Futher reference to how TypeScript works can be found in their [documentation](https://www.typescriptlang.org/docs/).

### pnpm
pnpm is a fast, disk space efficient package manager. It is faster than alternatives and it saves disk space. It is an alternative to npm and can be installed with the follwing commands:
- On Windows: `iwr https://get.pnpm.io/install.ps1 -useb | iex `
- Using npm: `npm install -g pnpm`
- Using Homebrew: `brew install pnpm`
If you seek more information on pnpm, check out their [documentation](https://pnpm.io/motivation).
