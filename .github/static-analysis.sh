#!/bin/sh

# SPDX-FileCopyrightText: 2024 Keith Maxwell <keith.maxwell@gmail.com>
#
# SPDX-License-Identifier: MPL-2.0

yamllint . \
&& git ls-files '*.yaml' '*.yml' | xargs npm exec prettier -- --check \
&& git ls-files '*.md' \
| xargs npm exec prettier -- --check --prose-wrap always \
&& git ls-files '*.json' | xargs -I{} sh -c "jq . {} | cmp {} -" \
&& npm exec embedme -- --verify README.md
