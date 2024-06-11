#!/bin/bash


# Directories containing ARB files
feature_dirs=("deriv_auth" "deriv_passkeys")

# Base localization directory
base_l10n_dir="lib/l10n"

# Function to convert snake_case to PascalCase
snake_to_pascal() {
    echo "$1" | awk 'BEGIN{FS=OFS="_"} {for(i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1' | sed 's/_//g'
}

for dir in "${feature_dirs[@]}"; do
    arb_dir="$base_l10n_dir/$dir"
    output_dir="$base_l10n_dir/generated/$dir"
    output_file="${dir}_localizations.dart"
    output_class="$(snake_to_pascal $dir)Localizations"

    # Execute the command
    flutter gen-l10n \
        --arb-dir="$arb_dir" \
        --output-localization-file="$output_file" \
        --output-class="$output_class" \
        --output-dir="$output_dir" \
        --no-synthetic-package
done

ls $base_l10n_dir/generated

echo "Localization generation complete."


# Add the generated localization files to Git
git add "$base_l10n_dir/generated"

# Commit the changes
git commit -m "Update localizations"


echo "Localization generation complete."
