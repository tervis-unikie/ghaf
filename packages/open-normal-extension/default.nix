# Copyright 2022-2024 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
{
  stdenvNoCC,
  pkgs,
  lib,
  config,
  ...
}:
stdenvNoCC.mkDerivation {
  name = "open-normal-extension";

  src = ./.;

  buildInputs = [pkgs.gettext];

  postInstall = ''
    mkdir -p "$out"
    cp -v ./manifest.json ./open_normal.js ./open_normal.sh "$out"
    chmod a+x "$out/open_normal.sh"
    ${pkgs.gettext}/bin/envsubst < "./fi.ssrc.open_normal.json" > "$out/fi.ssrc.open_normal.json"
  '';

  meta = with lib; {
    description = "Browser extension for Chromium to launch trusted browser";
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
    ];
  };
}
