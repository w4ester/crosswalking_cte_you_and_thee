#!/bin/bash

# MSDE Brand Colors
OLD_PURPLE="#667eea"
OLD_VIOLET="#764ba2"
NEW_RED="#BD0934"
NEW_YELLOW="#FFC838"
NEW_BLACK="#231F20"
NEW_GREY="#E2E3E4"

# Update all HTML and ASPX files
for file in *.html *.aspx; do
    if [ -f "$file" ]; then
        echo "Updating $file..."
        # Create backup
        cp "$file" "$file.bak"
        
        # Replace colors
        sed -i '' \
            -e "s/${OLD_PURPLE}/${NEW_RED}/gI" \
            -e "s/${OLD_VIOLET}/${NEW_YELLOW}/gI" \
            -e "s/#2d3748/${NEW_BLACK}/g" \
            -e "s/#718096/${NEW_BLACK}/g" \
            -e "s/#f7fafc/${NEW_GREY}/g" \
            -e "s/rgba(102, 126, 234/rgba(189, 9, 52/g" \
            -e "s/rgba(118, 75, 162/rgba(255, 200, 56/g" \
            -e "s/'Segoe UI', Tahoma, Geneva, Verdana, sans-serif/'Montserrat', 'Calibri', 'Segoe UI', sans-serif/g" \
            "$file"
    fi
done

echo "Color update complete!"
