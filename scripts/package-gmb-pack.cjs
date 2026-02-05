const fs = require('fs');
const path = require('path');

const deployDir = path.join(__dirname, '../business-deploy');
const gmbPackDir = path.join(deployDir, 'gmb-weekly-pack');

// Ensure directories exist
if (!fs.existsSync(deployDir)) fs.mkdirSync(deployDir);
if (!fs.existsSync(gmbPackDir)) fs.mkdirSync(gmbPackDir);

function packageGMB() {
    console.log('📦 Packaging GMB Weekly Content...');

    // Copy GMB Guide & Calendar
    const filesToCopy = [
        'GMB-POST-CALENDAR.md',
        'GMB-PERFECTION-BANK.md',
        'REVIEW-REPLY-TEMPLATES.md'
    ];

    filesToCopy.forEach(file => {
        const src = path.join(__dirname, '..', file);
        const dest = path.join(gmbPackDir, file);
        if (fs.existsSync(src)) {
            fs.copyFileSync(src, dest);
        }
    });

    // Create a 'How to Post' instruction
    const instructions = `
# How to Post This Week
1. Open GMB-POST-CALENDAR.md
2. Copy the text for the current week.
3. Open the Ad Generator (Option 3 in grimace.sh) to create your visuals.
4. Paste the text and upload the image to Google Business Profile.
`;
    fs.writeFileSync(path.join(gmbPackDir, 'INSTRUCTIONS.txt'), instructions);

    console.log(`✅ GMB Pack ready at: ${gmbPackDir}`);
}

packageGMB();
