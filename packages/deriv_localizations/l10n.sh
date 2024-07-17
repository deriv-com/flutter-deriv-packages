#!/bin/bash


# Directories containing ARB files
feature_dirs=("deriv_auth" "deriv_passkeys" "deriv_mobile_chart_wrapper")

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

# Add the generated localization files to Git
git add "$base_l10n_dir/generated"

# Create deriv_localizations.dart barrel file under lib folder.
localizations_file="lib/deriv_localizations.dart"
echo "// Generated file for exporting localization classes" > $localizations_file

for dir in "${feature_dirs[@]}"; do
    echo "export 'l10n/generated/$dir/${dir}_localizations.dart';" >> $localizations_file
done

echo "Created deriv_localizations.dart barrel file with exports."

# Add and commit the deriv_localizations.dart barrel file to Git
git add $localizations_file

# Commit the changes
git commit -m "Update localizations"

echo "Localization generation complete."
