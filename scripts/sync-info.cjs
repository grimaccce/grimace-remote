const fs = require('fs');
const path = require('path');

const infoPath = path.join(__dirname, '../business-info.json');
const info = JSON.parse(fs.readFileSync(infoPath, 'utf8'));

// Handle missing legacy fields safely
const tagline = info.tagline || "Fast, Friendly Remote IT Support";
const location = info.service_area || info.location || "East Gippsland";
const phone = info.phone;
const email = info.email || "support@grimaceremote.com.au";

const filesToUpdate = [
    {
        path: path.join(__dirname, '../premium-website/index.html'),
        updates: [
            { regex: /<h1>.*?<\/h1>/, replacement: `<h1>${info.name}</h1>` },
            { regex: /<p>.*?(Creative Developer|Security-First|Fast, Friendly).*?<\/p>/, replacement: `<p>${tagline}</p>` },
            { regex: /mailto:.*?\"/g, replacement: `mailto:${email}"` },
            { regex: /hello@alexmorgan\.com/g, replacement: email },
            { regex: /support@grimaceremote\.com\.au/g, replacement: email },
            { regex: /San Francisco, CA/g, replacement: location },
            { regex: /Bairnsdale, VIC 3875 \(Serving East Gippsland\)/g, replacement: location },
            { regex: /tel:.*?\"/g, replacement: `tel:${phone.replace(/\s/g, '')}"` },
            { regex: /sms:.*?\"/g, replacement: `sms:${phone.replace(/\s/g, '')}"` },
            { regex: /0407 464 371/g, replacement: phone },
            // Pricing updates removed as HTML now uses a different structure
        ]
    },
    {
        path: path.join(__dirname, '../ad-generator/app.js'),
        updates: [
            { regex: /ctx\.fillText\(\".*? Ad Generator\"/g, replacement: `ctx.fillText("${info.name} Ad Generator"` },
            { regex: /ctx\.fillText\(\"Grimace ad generator\"/g, replacement: `ctx.fillText("${info.name} Ad Generator"` }
        ]
    },
    {
        path: path.join(__dirname, '../tech-copilot/index.html'),
        updates: [
            { regex: /<h1>Tech Copilot<\/h1>/, replacement: `<h1>${info.name}</h1>` },
            { regex: /<span>Remote Support Assistant<\/span>/, replacement: `<span>${tagline}</span>` }
        ]
    }
];

filesToUpdate.forEach(file => {
    if (fs.existsSync(file.path)) {
        let content = fs.readFileSync(file.path, 'utf8');
        file.updates.forEach(update => {
            content = content.replace(update.regex, update.replacement);
        });
        fs.writeFileSync(file.path, content);
        console.log(`✅ Updated ${path.basename(file.path)}`);
    } else {
        console.warn(`⚠️  File not found: ${file.path}`);
    }
});
