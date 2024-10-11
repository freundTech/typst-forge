cargo build --locked --release --target wasm32-unknown-unknown

mkdir "%PREFIX%\Library\share\typst\packages\typst-forge\${{ name }}\${{ version }}"
copy typst.toml "%PREFIX%\Library\share\typst\packages\typst-forge\${{ name }}\${{ version }}"
copy README.md "%PREFIX%\Library\share\typst\packages\typst-forge\${{ name }}\${{ version }}"
copy lib.typ "%PREFIX%\Library\share\typst\packages\typst-forge\${{ name }}\${{ version }}"
copy target\wasm32-unknown-unknown\release\matryoshka.wasm "%PREFIX%\Library\share\typst\packages\typst-forge\${{ name }}\${{ version }}"
