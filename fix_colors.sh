#!/bin/bash

# Fix remaining old colors
for file in *.html *.aspx; do
    if [ -f "$file" ]; then
        echo "Fixing $file..."
        
        # Replace E31837 and FFC20E with correct MSDE colors
        sed -i '' \
            -e "s/#E31837/#BD0934/gI" \
            -e "s/#FFC20E/#FFC838/gI" \
            -e "s/rgba(227, 24, 55/rgba(189, 9, 52/g" \
            -e "s/rgba(255, 194, 14/rgba(255, 200, 56/g" \
            "$file"
    fi
done

# Clean up backup files
rm -f *.bak

echo "Color fix complete!"
