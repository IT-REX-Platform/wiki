# Frontend technologies
This document depicts the different options of technology we considered using for the project, as well as the reasons why we use them now or decided against them.

## TypeScript

TypeScript is a free, open-source programming language developed by Microsoft that adds static typing with optional type annotations to JavaScript. It is designed for the development of large applications and transpiles to JavaScript. Because TypeScript is a superset of JavaScript, all JavaScript programs are syntactically valid TypeScript, but they can fail to type-check for safety reasons.
TypeScript may be used to develop JavaScript applications for both client-side and server-side execution.
Nowadays TypeScript it the go to standard, when writing bigger application for the web, instead of plain JavaScript. It offers safty through the usage of types, classes and generics.
It also makes it easier for people that are familiar with Java, C++ or similiar programming languages to understand the code.
TypeScript is basically a must have in this project.

## React

React is a free and open-source frontend JavaScript library for building user interfaces based on components. It is currently (time of writing 01.05.2023) one of the most popular frontend frameworks on the market. It has a rich community and great documentation. It is an established technology, with its first release in 2013.
The popularity, the documentation and community made it a great choice for this project, especially with the thought in mind that future generation of students or programmers might work on this project.
Another factor was, that some of the frontend developers where already familiar with React and its ecosystem.

### Next.js

Next.js is a framework for React. It has build-in CSS support, build-in optimazation for images, scripts and fonts for a better user experience and uses data fetching to minimize the load time for the user.
It makes the usage of React easier and more enjoyable.

### Tailwind CSS

Tailwind automatically removes all unused CSS when building for production, which means your final CSS bundle is the smallest it could possibly be. It makes it also easy to change the layout and look of your website without the usage of extra CSS classes.
It is simply a utility-first CSS framework packed with classes to build any design, directly in your HTML. Or in our case, directly in the TSX files.

## Svelte

Svelte is another frontend framework used to build efficient UI. It is an up and coming framework, which was released in 2016. Svelte was considered because the innovative way of coding and the thrill of learning a new way of creating UI with JavaScript.
The reasons why we decided against Svelte is, for one the small ecosystem and community for the Svelte. Another point is the unpredictability of the future of Svelte, compared to the big contenders like React or Angular, which could make it harder for future developers to work with this project.

## Vue

Another frontend framework that was considered is Vue. It was first released in 2014 and is a "lightweight version of Angular", according to its creator. It provides similar features like React and Svelte, with Routing, component centered code or Reactivity.
It was only shortly considered as only minimal knowledge from prior usage was available in the inital frontend team.
