# Copyright 2022-2024 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
{
  stdenvNoCC,
  pkgs,
  lib,
  ...
}:

stdenvNoCC.mkDerivation {
  name = "open-normal-extension";

  src = ./.;

  postInstall = ''
    mkdir -p "$out"
    cp -v ./manifest.json ./open_normal.js ./open_normal.sh "$out"
    cat ./fi.ssrc.open_normal.json.pre > "$out/fi.ssrc.open_normal.json"
    echo -n "$out/open_normal.sh" >> "$out/fi.ssrc.open_normal.json"
    cat ./fi.ssrc.open_normal.json.post >> "$out/fi.ssrc.open_normal.json"
  '';

  meta = with lib; {
    description = "Browser extension for Chromium to launch trusted browser";
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
    ];
  };
}
