# Copyright 2022-2024 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
{
  stdenvNoCC,
  pkgs,
  lib,
  ...
}:

stdenvNoCC.mkDerivation {
  name = "open-trusted-extension";

  src = ./.;

  postInstall = ''
    mkdir -p "$out"
    cp -v ./manifest.json ./open_trusted.js ./open_trusted.sh "$out"
    cat ./fi.ssrc.open_trusted.json.pre > "$out/fi.ssrc.open_trusted.json"
    echo -n "$out/open_trusted.sh" >> "$out/fi.ssrc.open_trusted.json"
    cat ./fi.ssrc.open_trusted.json.post >> "$out/fi.ssrc.open_trusted.json"
  '';

  meta = with lib; {
    description = "Browser extension for Chromium to launch trusted browser";
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
    ];
  };
}
