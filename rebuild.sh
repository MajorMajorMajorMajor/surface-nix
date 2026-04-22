#!/bin/sh
sudo nixos-rebuild switch --flake /etc/nixos#surface \
  --option substituters "https://cache.nixos.org https://linux-surface.cachix.org" \
  --option trusted-public-keys "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= linux-surface.cachix.org-1:dorigzlDDV6AacaQLVHHYU8scAzBIlwAhGz/JQ8fVeI="
