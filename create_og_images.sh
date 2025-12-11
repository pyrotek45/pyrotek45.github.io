#!/bin/bash
# OG Image Generator - Creates Open Graph preview images with horizontal shadow effect
# Usage: ./create_og_images.sh

BASE="/home/pyrotek45/projects/blog/pyrotek45.github.io/_site"

# Create OG image with grid-pattern ghost text background
create_og_image() {
    local title="$1"
    local font_size="$2"
    local offset_y="$3"
    local output="$4"
    
    # Grid background text - same size, arranged in rows and columns
    local bg_font_size=$((font_size * 2))
    
    convert -size 1200x630 xc:'#111111' \
      -colorspace RGB \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#050505' -gravity center -annotate -550-200 "$title" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#050505' -gravity center -annotate -50-200 "$title" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#050505' -gravity center -annotate +450-200 "$title" \
      \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0a0a0a' -gravity center -annotate -650+0 "$title" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0a0a0a' -gravity center -annotate -150+0 "$title" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0a0a0a' -gravity center -annotate +350+0 "$title" \
      \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0f0f0f' -gravity center -annotate -750+200 "$title" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0f0f0f' -gravity center -annotate -250+200 "$title" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0f0f0f' -gravity center -annotate +250+200 "$title" \
      \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#1a1a1a' -gravity center -annotate +30-50 "$title" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#222222' -gravity center -annotate +20-50 "$title" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#2a2a2a' -gravity center -annotate +10-50 "$title" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#3a3a3a' -gravity center -annotate -10-50 "$title" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#4a4a4a' -gravity center -annotate -20-50 "$title" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#eeeeee' -gravity center -annotate +0-50 "$title" \
      \
      -font "DejaVu-Sans" -pointsize 44 -fill '#333333' -gravity south -annotate +0+40 'pyrotek45.github.io' \
      -stroke '#eeeeee' -strokewidth 8 -fill none \
      -draw 'rectangle 8,8 1192,622' \
      -fill '#110011' -draw 'point 0,0' \
      -depth 8 -define png:color-type=2 "$output"
    
    echo "✓ $(basename $output) ($font_size pt)"
}

# Create OG image with grid-pattern ghost text background (multi-line version)
create_og_image_multiline() {
    local title1="$1"
    local title2="$2"
    local font_size="$3"
    local output="$4"
    
    # Grid background text - same size, arranged in rows and columns
    local bg_font_size=$((font_size * 2))
    
    convert -size 1200x630 xc:'#111111' \
      -colorspace RGB \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#050505' -gravity center -annotate -550-220 "$title1" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#050505' -gravity center -annotate -50-220 "$title1" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#050505' -gravity center -annotate +450-220 "$title1" \
      \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0a0a0a' -gravity center -annotate -650+20 "$title2" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0a0a0a' -gravity center -annotate -150+20 "$title2" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0a0a0a' -gravity center -annotate +350+20 "$title2" \
      \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0f0f0f' -gravity center -annotate -750+250 "$title1" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0f0f0f' -gravity center -annotate -250+250 "$title1" \
      -font "DejaVu-Sans-Bold" -pointsize "$bg_font_size" -fill '#0f0f0f' -gravity center -annotate +250+250 "$title1" \
      \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#1a1a1a' -gravity center -annotate +30-72 "$title1" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#222222' -gravity center -annotate +20-72 "$title1" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#2a2a2a' -gravity center -annotate +10-72 "$title1" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#3a3a3a' -gravity center -annotate -10-72 "$title1" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#4a4a4a' -gravity center -annotate -20-72 "$title1" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#eeeeee' -gravity center -annotate +0-80 "$title1" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#1a1a1a' -gravity center -annotate +30+18 "$title2" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#222222' -gravity center -annotate +20+18 "$title2" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#2a2a2a' -gravity center -annotate +10+18 "$title2" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#3a3a3a' -gravity center -annotate -10+18 "$title2" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#4a4a4a' -gravity center -annotate -20+18 "$title2" \
      -font "DejaVu-Sans-Bold" -pointsize "$font_size" -fill '#eeeeee' -gravity center -annotate +0+10 "$title2" \
      \
      -font "DejaVu-Sans" -pointsize 44 -fill '#333333' -gravity south -annotate +0+40 'pyrotek45.github.io' \
      -stroke '#eeeeee' -strokewidth 8 -fill none \
      -draw 'rectangle 8,8 1192,622' \
      -fill '#110011' -draw 'point 0,0' \
      -depth 8 -define png:color-type=2 "$output"
    
    echo "✓ $(basename $output) ($font_size pt × 2 lines)"
}

echo "Creating OG images with horizontal shadow background effect..."
echo ""

# Create images with different font sizes based on title length
create_og_image "pyrotek45" 120 "-50" "$BASE/og-home.png"
create_og_image "Avon" 140 "-50" "$BASE/og-avon.png"
create_og_image "How to be Wise" 110 "-50" "$BASE/og-blog-how-to-be-wise.png"
create_og_image_multiline "Programming" "Languages" 90 "$BASE/og-programming-langs.png"

echo ""
echo "✓✓✓ Done! OG images created with horizontal shadow effect!"
echo ""
echo "To regenerate these images in the future, run:"
echo "  ./create_og_images.sh"
