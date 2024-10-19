# typst-forge

The unofficial, conda-based package repository for Typst.

## What is typst-forge?

typst-forge is an unofficial package repository for [Typst](https://typst.app). If is integrated into the conda ecosystem. We recommend using it with the [pixi](https://pixi.sh) package manager.

You can see a list of packages on typst forge at https://prefix.dev/channels/typst-forge

|                                                          | typst-forge | [Typst Universe](https://typst.app/universe) |
| -------------------------------------------------------- | ----------- | -------------------------------------------- |
| Official                                                 | ❌          | ✅                                           |
| Distributes packages                                     | ✅          | ✅                                           |
| Distributes templates                                    | ✅          | ✅                                           |
| Works using CLI                                          | ✅          | ✅                                           |
| Works using the web app                                  | ❌          | ✅                                           |
| Supports packages with large files                       | ✅          | ❌                                           |
| Supports packages with fonts                             | ✅          | ❌                                           |
| Also disributes Typst itself                             | ✅          | ❌                                           |
| Also distributes other tools like linters and formatters | ✅          | ❌                                           |
| Integrates with self-hosted repositories                 | ✅          | ❌                                           |
| Supports multiple versions of one package in a project   | ❌          | ✅                                           |


## Using typst-forge

First install [pixi](https://pixi.sh).

To get started run `pixi init -c conda-forge -c https://prefix.dev/typst-forge`. This will create a pixi project with both the conda-forge and typst-forge channel. The typst-forge channel hosts typst packages, while conda-forge hosts typst itself and additional tools.

```sh
$ pixi init -c conda-forge -c https://prefix.dev/typst-forge
✔ Initialized project in /var/home/adrian/Documents/dev/typst/pixi.
```

Next add typst itself to your project. You can also specify the version you want to use. Though take note that typst-forge packages require at least typst 0.12.0.

```sh
$ pixi add 'typst==0.12.0'
✔ Added typst
```
You can now run Typst using `pixi run typst`.

With typst added you can add a package. All typst packages names are prefixed with `typst-`
```sh
$ pixi add 'typst-matryoshka==0.1.0'
✔ Added typst-matryoshka
```
When adding typst packages you should always specify a version. This is because Typst doesn't support import without version specification, you will need to manually keep your Typst imports and pixi dependencies in sync.
```typst
#import "@typst-forge/matryoshka:0.1.0": *
```
Instead of using `pixi add` you can also manually modify `pixi.toml`.

We recommend also adding a pixi task to build your project:
```sh
$ pixi task add compile "typst compile main.typ"
✔ Added task `compile`: typst compile main.typ
```
You can now run `pixi run compile` to compile your document.


## Submitting packages

To submit a package to typst-forge you just need to fork this repository and create a pull request with your changes.
Create a new directory for your package and copy and adjust the `recipe.yaml` file from another package.
You can look at [matroshka](matryoshka/recipe.yaml) for how to create a package with a WASM plugin, at [moderner-cv](moderner-cv/recipe.yaml) for how to create a template and at [fontawesome](fontawesome/recipe.yaml) for how to create a package with a font (The font itself is packaged on [conda-forge](https://github.com/conda-forge/font-otf-fontawesome-feedstock/), while the typst package only has a dependency on it.

You can test your recipes locally by running `pixi run build <package-name>>`.

The full documentation for the recipe format can be found in the [rattler-build documentation](https://prefix-dev.github.io/rattler-build/latest/reference/recipe_file/).
