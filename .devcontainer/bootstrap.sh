#!/usr/bin/env bash
set -e

echo "🔧 Installing Python tooling…"
pip install --upgrade pip
pip install poetry

echo "🔧 Enabling direnv for this workspace…"
cd /workspace
direnv allow

echo "✅ Dev container bootstrap complete."
