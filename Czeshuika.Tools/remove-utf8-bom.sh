#!/bin/bash
# vi: set tabstop=4 shiftwidth=4 noexpandtab :

## Удаляем "BOM" сигнатуру у прототипов (.yml)

find Resources/Prototypes \
    -type f \
    -regex '.+\.yml$' \
    -exec bash -c 'file "{}" | grep "UTF-8 (with BOM)"' \; \
    -exec bash -c 'sed -i "1s/^\xEF\xBB\xBF//" {}' \;
