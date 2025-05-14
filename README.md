# 🧩 Vide UI Suite

A collection of super generic, unstyled UI components made for [**Vide**](https://github.com/centau/vide).  
They’re inspired by how UI is built on the web — think React, Tailwind, or headless components — but made to work nicely with Vide and Roblox.
This is a suite, it comes with user defined `Types` and `Hooks`, aswell as `Contexts` for state data, and `Utils` for functions. 
The components are **NOT** standalone. Withou the `Utils`, the code will error, without the `Types`, static analysis will break, so on, so forth.

## 🧠 Type Safety & Boilerplate

To keep things type-safe and predictable, some components use a bit of extra boilerplate —  
mostly around utility functions and custom-defined types. This helps everything play nicely with strict type checking in Luau.

If you're using your own utils or type system, feel free to adapt or replace them.
