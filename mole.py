#!/usr/bin/env python3
"""
map_project.py

Un script para trazar la estructura de carpetas y archivos de un proyecto en macOS.
Genera un archivo de texto con el árbol de directorios, ignorando extensiones y carpetas
definidas por defecto o por el usuario.

Uso:
    ./map_project.py [--ignore-exts png jpg] [--ignore-dirs build .git] [--output estructura.txt]

Requisitos: Python 3.x
"""

import os
import argparse
from pathlib import Path

# Ignorar estas extensiones por defecto (imágenes, binarios, temporales)
DEFAULT_IGNORE_EXTS = {
    '.png', '.jpg', '.jpeg', '.gif', '.bmp',
    '.svg', '.webp', '.ico', '.pyc', '.class', '.o',
    '.dSYM', '.lock', '.xcuserstate'
}

# Ignorar estas carpetas por defecto
DEFAULT_IGNORE_DIRS = {
    '.git', 'node_modules', 'Pods', 'build', 'dist',
    '__pycache__', '.idea', '.vscode', 'DerivedData'
}

def parse_args():
    parser = argparse.ArgumentParser(
        description="Mapea la estructura de tu proyecto en un archivo de texto."
    )
    parser.add_argument(
        '--ignore-exts', nargs='*', default=[],
        help="Lista de extensiones a ignorar (sin el punto). Ej: --ignore-exts png jpg"
    )
    parser.add_argument(
        '--ignore-dirs', nargs='*', default=[],
        help="Lista de nombres de carpetas a ignorar. Ej: --ignore-dirs build .git"
    )
    parser.add_argument(
        '--output', '-o', default='directory_structure.txt',
        help="Ruta del archivo de salida. Por defecto: directory_structure.txt"
    )
    return parser.parse_args()

def map_directory(root: Path, prefix: str, writer, ignore_exts, ignore_dirs):
    entries = sorted([e for e in os.listdir(root) if not e.startswith('.')])
    filtered = []
    for entry in entries:
        full = root / entry
        ext = full.suffix.lower()
        if full.is_file() and ext in ignore_exts:
            continue
        if full.is_dir() and entry in ignore_dirs:
            continue
        filtered.append(entry)

    for idx, entry in enumerate(filtered):
        full = root / entry
        connector = '├── ' if idx < len(filtered) - 1 else '└── '
        writer.write(f"{prefix}{connector}{entry}\n")
        if full.is_dir():
            extension = '│   ' if idx < len(filtered) - 1 else '    '
            map_directory(full, prefix + extension, writer, ignore_exts, ignore_dirs)

def main():
    args = parse_args()
    # Construye conjuntos de ignorados
    user_ignore_exts = {f".{e.lower().lstrip('.')}" for e in args.ignore_exts}
    user_ignore_dirs = set(args.ignore_dirs)
    ignore_exts = DEFAULT_IGNORE_EXTS.union(user_ignore_exts)
    ignore_dirs = DEFAULT_IGNORE_DIRS.union(user_ignore_dirs)

    root = Path.cwd()
    output = Path(args.output)

    with output.open('w', encoding='utf-8') as f:
        f.write(f"{root.name}/\n")
        map_directory(root, '', f, ignore_exts, ignore_dirs)

    print(f"Estructura de directorios guardada en: {output.resolve()}")

if __name__ == '__main__':
    main()

# Para convertir este script en ejecutable:
# chmod +x map_project.py

