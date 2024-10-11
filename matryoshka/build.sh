cargo build --locked --release --target wasm32-unknown-unknown

mkdir -p "$PREFIX/share/typst/packages/typst-forge/${{ name }}/${{ version }}"
cp typst.toml README.md lib.typ target/wasm32-unknown-unknown/release/matryoshka.wasm
    "$PREFIX/share/typst/packages/typst-forge/${{ name }}/${{ version }}"
